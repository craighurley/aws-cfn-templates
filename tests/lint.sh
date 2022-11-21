#!/usr/bin/env bash

set -e

# print general info
pwd
python --version
cfn-lint --version

p=$(dirname "$0")

# yaml
echo Linting yaml files
yamllint -c "$p"/../.yamllint "$p"/../

# cfn templates
echo Linting CloudFormation templates
(
    cd "$p"/../
    cfn-lint --config-file ./.cfnlintrc -I
)

echo Success
