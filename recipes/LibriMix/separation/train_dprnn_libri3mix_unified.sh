#!/usr/bin/env bash

cmd="/path/to/slurm.pl --quiet"

source activate CONDA_ENV

$cmd log/dprnn-libri3mix-unified.log \
python train_unified.py hparams/dprnn-libri3mix-unified.yaml --data_folder /path/to/data/LibriMix/Libri3Mix/ --dynamic_mixing False

