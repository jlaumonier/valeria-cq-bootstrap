#!/bin/bash
#$1 config file
#SBATCH --mem-per-cpu=2G
#SBATCH --time=1:00:00
#SBATCH --cpus-per-task=2
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1

./bootstrap/bootstrap.sh $1


