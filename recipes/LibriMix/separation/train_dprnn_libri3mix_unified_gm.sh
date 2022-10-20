#!/usr/bin/env bash

cmd="/path/to/slurm.pl --quiet"

source activate CONDA_ENV

$cmd log/dprnn-libri3mix-unified-gm.log \
python train_unified_gm.py hparams/dprnn-libri3mix-unified-gm.yaml --data_folder /path/to/data/LibriMix/Libri3Mix/ --dynamic_mixing False

