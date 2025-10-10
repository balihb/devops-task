#!/bin/bash

virtualenv .venv
# shellcheck source=/dev/null
source .venv/bin/activate
pip install -r requirements.txt
