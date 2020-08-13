#!/bin/bash
#SBATCH --mem-per-cpu=4G
#SBATCH --time=12:00:00
#SBATCH --cpus-per-task=4
#SBATCH --partition=batch

INI_FILE=bootstrap.ini

. read_config.sh $INI_FILE
. init_modules.sh $INI_FILE 

python3 -m venv $SLURM_TMPDIR/env
source $SLURM_TMPDIR/env/bin/activate
pip install --no-index --upgrade pip
pip install --no-index -r test_requirements.txt
python3 test.py

