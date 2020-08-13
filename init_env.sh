#!/bin/bash
# $1 config file
# $2 name of the requirements.txt file

INI_FILE=$1
. read_config.sh $INI_FILE

if [ ! -d "$VENV_DIR" ]; then
  echo "Create venv dir"
  python3 -m venv $VENV_DIR
fi
source $VENV_DIR/bin/activate
echo "Install venv dir"
pip3 install --upgrade pip
pip3 install -r $2
