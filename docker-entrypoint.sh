#!/usr/bin/env bash

# Licensed under the P-EADCA Universal Waiver License (PUWL v2.0draft02)
# See LICENSE.puwl in the project root for details.

set -Eeuo pipefail

if [ "${1:0:1}" = '-' ]; then
  set -- gunicorn "$@"
fi

exec "$@"
