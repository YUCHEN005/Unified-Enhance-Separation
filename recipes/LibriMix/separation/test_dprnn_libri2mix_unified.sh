#!/usr/bin/env bash

cmd="/path/to/slurm.pl --quiet"

source activate CONDA_ENV

$cmd log/test-dprnn-libri2mix-unified.log \
python train.py hparams/dprnn-libri2mix-unified.yaml --data_folder /path/to/data/LibriMix/Libri2Mix/ --test_only True

