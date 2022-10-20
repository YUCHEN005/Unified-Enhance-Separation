#!/usr/bin/env bash

cmd="/path/to/slurm.pl --quiet"

source activate CONDA_ENV

$cmd log/dprnn-libri2mix-unified-gm.log \
python train_unified_gm.py hparams/dprnn-libri2mix-unified-gm.yaml --data_folder /path/to/data/LibriMix/Libri2Mix/ --dynamic_mixing False

