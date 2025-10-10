#!/bin/bash

# Assumes an existing virtualenv at .venv
# shellcheck source=/dev/null
source .venv/bin/activate
python -m unittest helloapp.test
