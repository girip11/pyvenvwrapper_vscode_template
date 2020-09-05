#!/bin/bash

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
PYENV_VERSION=$(cat "$PROJECT_DIR/.python-version")
VENV_ROOT=".venv"
VENV_NAME=${1:-env1}
VENVWRAPPER_SCRIPT="virtualenvwrapper.sh"

pyenv shell "$PYENV_VERSION"
echo "Current Python version: $(python --version)"

VENVWRAPPER_SCRIPT_PATH="$(pyenv which $VENVWRAPPER_SCRIPT)"
export WORKON_HOME="$PROJECT_DIR/$VENV_ROOT"
echo "WORKON_HOME is : ${WORKON_HOME}"

echo "Activating the virtual environment ${VENV_NAME}"
source "$VENVWRAPPER_SCRIPT_PATH"

workon "$VENV_NAME"

echo "Currently activated virtual env: ${VIRTUAL_ENV}"
