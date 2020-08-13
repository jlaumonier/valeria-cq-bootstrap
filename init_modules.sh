#!/bin/bash
# Must be run with . init_modules.sh to keep the modules loaded
# $ config file

INI_FILE=$1
. read_config.sh $INI_FILE

echo "Loading $MODULES"
module load $MODULES
module list
