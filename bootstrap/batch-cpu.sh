#!/bin/bash
#SBATCH --mem-per-cpu=4G
#SBATCH --time=12:00:00
#SBATCH --cpus-per-task=4
#SBATCH --partition=batch

./bootstrap/bootstrap.sh $1

