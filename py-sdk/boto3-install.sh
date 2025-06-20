#!/usr/bin/env bash
set -e

python -m venv .venv
source .venv/bin/activate
pip install boto3

# make sure the aws access credentials are configured in the environment before creating boto3 clients