#!/bin/sh
# Add alias to the .bashrc or .bash_aliases file
# alias simple_tgbot='sh ~/code/tgbot_simple/run.sh'

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
TEMPLATE_NAME=tgbot_simple
TEMPLATE_PATH=$SCRIPT_DIR/$TEMPLATE_NAME
NEW_DIR=$(pwd)/$TEMPLATE_NAME
if [ $# -eq 1 ]; then NEW_DIR=$1; fi

if cp -r $TEMPLATE_PATH $NEW_DIR; then
    cd $NEW_DIR
    git init
    python -m venv env
    source ./env/bin/activate
    pip install --upgrade pip
    pip install -r requirements.txt
    pip install black flake8
    code $(pwd)
else
    exit 1
fi
