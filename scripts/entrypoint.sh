#!/bin/bash

if [ -z "${AWS_LAMBDA_RUNTIME_API}" ]; then
  python3 main.py
else
  python3 -m awslambdaric ${1}
fi