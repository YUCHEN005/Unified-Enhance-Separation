# Noisy speech separation with LibriMix


## Usage

Please kindly run following commands to train the SepFormer-based unified network with gradient modulation:

```bash
python train_unified_gm.py hparams/sepformer-libri2mix-unified-gm.yaml --data_folder /path/to/data/LibriMix/Libri2Mix/ --dynamic_mixing False
python train_unified_gm.py hparams/sepformer-libri3mix-unified-gm.yaml --data_folder /path/to/data/LibriMix/Libri3Mix/ --dynamic_mixing False
```

After training process, kindly use the following commands for inference:

```bash
python train.py hparams/sepformer-libri2mix-unified-gm.yaml --data_folder /path/to/data/LibriMix/Libri2Mix/ --test_only True
python train.py hparams/sepformer-libri3mix-unified-gm.yaml --data_folder /path/to/data/LibriMix/Libri3Mix/ --test_only True
```

These commands can also be found in bash scripts with name `${phase}_${backbone}_${data}_${method}.sh`. The `${phase}` is selected from `['train', 'test']`, `${backbone}` is selected from `['dprnn', 'sepformer']`, and `${data}` is selected from `['libri2mix', 'libri3mix']`. `${method}` is selected from `['unified', 'unified_gm']`, where `'unified'` denotes employing unified network only, and `'unified_gm'` denotes further applying gradient modulation strategy.

Corresponding configuration files are provided in `hparams/` with similar names.

The core code of our approach can be found in `train_unified_gm.py`:

- Unified network: line 87-118 [[link]](https://github.com/YUCHEN005/Unified-Enhance-Separation/blob/master/recipes/LibriMix/separation/train_unified_gm.py#L87)

- Gradient modulation: line 257-294 [[link]](https://github.com/YUCHEN005/Unified-Enhance-Separation/blob/master/recipes/LibriMix/separation/train_unified_gm.py#L257)


## Libri-2/3Mix
The Libri2Mix and Libri3Mix datasets can be created using the scripts at [https://github.com/JorisCos/LibriMix](https://github.com/JorisCos/LibriMix).


## Perfomance

Our proposed approach has achieved the state-of-the-art on LibriMix dataset.

- Results on Libri2Mix-noisy dataset:

| Model        | SI-SNRi (dB)   | SDRi (dB)  | # Params  |
| :------------------ | :-----: | :-----: | :-----: |
| ConvTasNet          |  12.0   |  12.4   |  5.1 M  |
| Dual-Path RNN       |  14.2   |  14.7   |  14.6 M |
| SepFormer           |  14.9   |  15.4   |  25.7 M |
| Wavesplit           |  15.1   |  15.8   |  29.0 M |
| Ours (DPRNN)        |  15.4   |  16.0   |  19.7 M |
| Ours (SepFormer)    |  16.0   |  16.5   |  29.2 M |

- Results on Libri3Mix-noisy dataset:

| Model        | SI-SNRi (dB)   | SDRi (dB)  | # Params  |
| :------------------ | :-----: | :-----: | :-----: |
| ConvTasNet          |  10.4   |  10.9   |  5.1 M  |
| Wavesplit           |  13.1   |  13.8   |  29.0 M |
| Dual-Path RNN       |  14.0   |  14.4   |  14.7 M |
| SepFormer           |  14.3   |  14.8   |  25.7 M |
| Ours (DPRNN)        |  15.4   |  15.9   |  19.7 M |
| Ours (SepFormer)    |  15.8   |  16.4   |  29.2 M |

