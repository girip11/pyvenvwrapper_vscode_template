#!/bin/bash
PYTHON_VENV=$1
FILE=$2

echo "Running isort"
"${PYTHON_VENV}/bin/isort" "$FILE"

echo "Running autoflake"
"${PYTHON_VENV}/bin/autoflake" -i --remove-all-unused-imports "$FILE"
