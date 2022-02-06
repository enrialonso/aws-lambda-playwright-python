#!/bin/bash

set -a
. $(pwd)/env/${1}.env
set +a

sls invoke --function "PlaywrightDockerPython" --log -c "$(pwd)/serverless.yml"