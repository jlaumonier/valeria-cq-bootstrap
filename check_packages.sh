#!/bin/bash

INI_FILE=check_packages.ini

. init_modules.sh $INI_FILE

. init_env.sh $INI_FILE check_packages_requirements.txt

echo "Check packages"
python3 check_packages.py
