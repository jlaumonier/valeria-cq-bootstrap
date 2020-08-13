#!/bin/bash

PYTHON_MAJOR_VERSION=3
PYTHON_MINOR_VERSION=8
PYTHON_REVISION_VERSION=4

for package in $(cat requirements.txt)
do 
    avail_wheels $package --all_versions -p $PYTHON_MAJOR_VERSION.$PYTHON_MINOR_VERSION
done
