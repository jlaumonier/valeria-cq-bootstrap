#!/bin/bash
# $1 config file

INI_FILE=$1
. ./bootstrap/read_config.sh $INI_FILE

if [ ! -d "$VENV_DIR" ]; then
  echo "Create venv dir"
  if [ ! -z "$SLURM_TMPDIR" ]; then
     echo "SLURM environment"
     FINAL_VENV_DIR="$SLURM_TMPDIR/$VENV_DIR"
     PIP_NO_INDEX="--no_index"
  else
     echo "normal environment"
     FINAL_VENV_DIR=$VENV_DIR
  fi
  python3 -m venv $FINAL_VENV_DIR
  source $FINAL_VENV_DIR/bin/activate
  echo "Install venv dir"
  pip3 install $PIP_NO_INDEX --upgrade pip
  pip3 install $PIP_NO_INDEX -r $REQUIREMENTS_FILE
fi
