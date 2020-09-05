#!/bin/bash

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
PYENV_VERSION=$(cat "$PROJECT_DIR/.python-version")
VENV_ROOT=".venv"
VENV_NAME=${1:-env1}
VENVWRAPPER_SCRIPT="virtualenvwrapper.sh"

pyenv shell "$PYENV_VERSION"
echo "Current Python version: $(python --version)"

VENVWRAPPER_SCRIPT_PATH="$(pyenv which $VENVWRAPPER_SCRIPT)"

if [ -z "$(which "$VENVWRAPPER_SCRIPT_PATH")" ]; then
  script_name=$(basename "$VENVWRAPPER_SCRIPT")
  echo "${script_name/.sh/} is not installed. Exiting..."
  exit 1
fi

export WORKON_HOME="$PROJECT_DIR/$VENV_ROOT"

echo "Creating virtual environment named $VENV_NAME under $WORKON_HOME"
mkdir -p "$WORKON_HOME"

source "$VENVWRAPPER_SCRIPT_PATH"

mkvirtualenv -r "$PROJECT_DIR/requirements-dev.txt" "$VENV_NAME"

if [[ $? -eq 0 ]]; then
  echo "Successfully created virtual environment"
else
  echo "Virtual environment creation failed"
fi
