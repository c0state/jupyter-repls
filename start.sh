#!/usr/bin/env bash

set -ex

# ---------- js/ts support

poetry run yarn

if ! command -v tslab; then
    # tslab needs to be on the path for jupyter lab to pick it up
    export PATH=./node_modules/.bin:$PATH
fi
poetry run yarn tslab install

# ---------- rust support

if ! command -v evcxr_jupyter >/dev/null; then
    cargo install evcxr_jupyter
fi
poetry run evcxr_jupyter --install

poetry run jupyter lab
