#!/bin/bash
# $1 name of the requirements.txt file

INI_FILE=bootstrap.ini
. read_config.sh $INI_FILE

if [ ! -d "$VENV_DIR" ]; then
  python3 -m venv $VENV_DIR
fi
source $VENV_DIR/bin/activate
pip3 install --upgrade pip
pip3 install -r $1
