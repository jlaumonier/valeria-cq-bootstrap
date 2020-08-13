# valeria-cq-bootstrap
Tools for bootstraping python environment in CalculQuebec/Valeria infrastructure

Existing tools are the following:
- check_package.sh : check if packages present in requirements.txt (including strict version at the momment, as output by pip freeze) are present as a wheel in compute canada infrastructure as stated in https://docs.computecanada.ca/wiki/Available_software and from the command avail_wheels
- init_env.sh : create the virtual env defined in config file (1st parameter) and requirements.txt (2nd parameter)
- init_modules.sh : initialize the modules (with command module) as defined in config file (1st parameter). Always install python module.
- remove_env.sh : remove the environment directory as defined in config file (1st parameter)

Config files :  this file define the following variable
- PYTHON_VERSION : version of python to be used 
- MODULES[] : modules to install 
- VENV_DIR : directory of the virtual environment
