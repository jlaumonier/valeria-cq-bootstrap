#!/bin/bash
# $1 config file

INI_FILE=$1
. read_config.sh $INI_FILE

deactivate
rm -rf $VENV_DIR
