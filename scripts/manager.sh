#!/bin/bash

set -a
. $(pwd)/env/${1}.env
set +a

sls ${2} -c "$(pwd)/serverless.yml" ${3}