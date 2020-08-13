#!/bin/bash

INI_FILE=bootstrap.ini
. read_config.sh $INI_FILE
. init_env.sh check_packages_requirements.txt

#for package in $(cat requirements.txt)
#do
#    avail_wheels $package --all_versions -p $PYTHON_MAJOR_VERSION.$PYTHON_MINOR_VERSION
#done

AVAIL_WHEELS=
