#!/bin/bash
# $1 path and name of the ini file
# $2 optional parameter to pass to the python script

INI_FILE=$1

. ./bootstrap/read_config.sh $INI_FILE
. ./bootstrap/init_modules.sh $INI_FILE
. ./bootstrap/init_env.sh $INI_FILE $REQUIREMENTS_FILE
. ./bootstrap/execute.sh $INI_FILE $2