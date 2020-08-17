#!/bin/bash
# $1 config file
# $2 optional parameter to pass to the python script
# assume venv is activate

INI_FILE=$1
. ./bootstrap/read_config.sh $INI_FILE

python3 $EXECUTION_SCRIPT $2