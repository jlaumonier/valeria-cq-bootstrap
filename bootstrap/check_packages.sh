#!/bin/bash
# check package existance on compute canada infrastructure like. need avail_wheels command
#$1 config file to test

INI_FILE=./bootstrap/check_packages.ini
. ./bootstrap/bootstrap.sh $INI_FILE $1
. ./bootstrap/remove_env.sh $INI_FILE