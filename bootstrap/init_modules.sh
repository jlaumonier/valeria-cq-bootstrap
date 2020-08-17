#!/bin/bash
# Must be run with . init_modules.sh to keep the modules loaded
# $ config file

INI_FILE=$1
. ./bootstrap/read_config.sh $INI_FILE

if ! command -v module &>/dev/null
then
  echo "Module command not found"
else
  echo "Loading $MODULES"
  module load $MODULES
  module list
fi
