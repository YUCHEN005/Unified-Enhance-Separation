#!/usr/bin/env bash

#cmd="/path/to/slurm.pl --quiet"
#
#source activate CONDA_ENV
#
#$cmd log/dprnn-libri2mix-unified.log \
#python train_unified.py hparams/dprnn-libri2mix-unified.yaml --data_folder /path/to/data/LibriMix/Libri2Mix/ --dynamic_mixing False



cmd="/home3/chenchen/research/maison2/egs/VB/slurm.pl --quiet --nodelist=node01 --gpu 1 --num-threads 2"

source activate asteroid

$cmd log/dprnn-libri2mix-unified.log \
python train_unified.py hparams/dprnn-libri2mix-unified.yaml --data_folder /home3/chenchen/data/LibriMix/Libri2Mix/ --dynamic_mixing False
