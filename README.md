# valeria-cq-bootstrap
Tools for bootstraping python environment in Calcul Quebec (https://www.calculquebec.ca/) / Valeria (https://valeria.science) infrastructure

Existing tools:
- `bootstrap.sh` : main script which init modules, venv and launch the python script as defined in config file (1st parameter)
- `install.sh` : install all boostrap scripts in a python projet (path is 1st parameter). create a bootstrap.ini in this path as config file (to modify).
- `check_package.sh` : check if packages present in `REQUIREMENTS_FILE` (including strict version at the moment, as output by pip freeze) are present as a wheel in compute canada infrastructure as stated in https://docs.computecanada.ca/wiki/Available_software and from the command avail_wheels
- `init_env.sh` : create the virtual env defined in config file (1st parameter)
- `init_modules.sh` : initialize the modules (with command module) as defined in config file (1st parameter). Always install python module.
- `remove_env.sh` : remove the environment directory as defined in config file (1st parameter)
- `execute.sh `: execute python script as define in config file (1st parameter). Assume the venv is init and activated. Second parameter is pass to the python script 

All scripts must be launch from the parent directory of bootstrap/. Because i do not find how to include other bash scripts independently of their location :( 

Config files :  this file define the following variable
- `PYTHON_VERSION` : version of python to be used 
- `MODULES[]` : modules to install 
- `VENV_DIR` : directory of the virtual environment
- `REQUIREMENTS_FILE` : requirement file name
- `EXECUTION_SCRIPT` : python script to launch
