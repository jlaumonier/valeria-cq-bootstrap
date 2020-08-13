#!/bin/bash
# Must be run with . init_modules.sh to keep the modules loaded

INI_FILE=bootstrap.ini
. read_config.sh $INI_FILE

echo "Loading $MODULES"
module load $MODULES
module list
