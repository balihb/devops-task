# Licensed under the P-EADCA Universal Waiver License (PUWL v2.0draft02)
# See LICENSE.puwl in the project root for details.

# hadolint global ignore=DL3018
# renovate: datasource=docker depName=python
ARG PYTHON_VERSION=3.14.7
# renovate: datasource=docker depName=alpine
ARG ALPINE_VERSION=3.22
FROM python:${PYTHON_VERSION}-alpine${ALPINE_VERSION} AS builder

ARG APP_VERSION=0.0.0dev0

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

ENV PIP_PROGRESS_BAR="off"
ENV PYTHONUNBUFFERED=1

ENV OLD_PATH=$PATH
ENV BUILD_VIRTUAL_ENV=/opt/build-venv
ENV RUNTIME_VIRTUAL_ENV=/opt/venv

# create venvs
RUN python3 -m venv --system-site-packages "$BUILD_VIRTUAL_ENV" && \
    python3 -m venv --system-site-packages "$RUNTIME_VIRTUAL_ENV"

# setup build venv
ENV VIRTUAL_ENV=$BUILD_VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$OLD_PATH"

COPY . /src
WORKDIR /src

# install build tools and build
RUN echo "__version__ = '${APP_VERSION}'" > "src/helloapp/_version.py" && \
    python3 -m pip install --no-cache-dir --upgrade -r requirements-build.txt && \
    python3 -m build --wheel

# setup runtime venv
ENV VIRTUAL_ENV=$RUNTIME_VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$OLD_PATH"

# install package
RUN pip install --no-cache-dir --disable-pip-version-check dist/*.whl

# runtime image
FROM python:${PYTHON_VERSION}-alpine${ALPINE_VERSION}

ENV PYTHONUNBUFFERED=1

RUN apk add --no-cache bash

COPY --chmod=755 docker-entrypoint.sh /usr/local/bin/

# copy venv
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
COPY --from=builder /opt/venv $VIRTUAL_ENV

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

HEALTHCHECK --interval=1m --timeout=3s CMD [ "exec 3<>/dev/tcp/127.0.0.1/8080; echo -e \"GET /health HTTP/1.1\r\nhost: http://localhost\r\nConnection: close\r\n\r\n\" >&3; grep \"HTTP/1.1 200 OK\" <&3" ]
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["gunicorn", "-b", "0.0.0.0:8080", "helloapp:app"]
