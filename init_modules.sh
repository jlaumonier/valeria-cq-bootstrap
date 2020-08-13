#!/bin/bash
# Must be run with . init_modules.sh to keep the modules loaded

INI_FILE=bootstrap.ini

. read_config.sh $INI_FILE

echo "Adding python to the modules to load"
PYTHON_VERSION="$(eval echo $\{configuration_${section}[PYTHON_VERSION]\})"
MODULES="$(eval echo $\{configuration_${section}[MODULES]\}) python/$PYTHON_VERSION"

echo "Loading $MODULES"
module load $MODULES
module list
