#!/usr/bin/env bash

set -e

poetry run yarn

if [[ ! $(command -v tslab) ]]; then
    # tslab needs to be on the path for jupyter lab to pick it up
    export PATH=$PATH:./node_modules/.bin
fi
poetry run yarn tslab install
poetry run jupyter lab

