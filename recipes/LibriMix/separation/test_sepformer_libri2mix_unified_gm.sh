#!/usr/bin/env bash

cmd="/path/to/slurm.pl --quiet"

source activate CONDA_ENV

$cmd log/test-sepformer-libri2mix-unified-gm.log \
python train.py hparams/sepformer-libri2mix-unified-gm.yaml --data_folder /path/to/data/LibriMix/Libri2Mix/ --test_only True

