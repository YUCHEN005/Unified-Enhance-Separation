# Unifying Speech Enhancement and Separation with Gradient Modulation for End-to-End Noise-Robust Speech Separation

## Introduction

We propose a novel network to unify speech enhancement and separation with gradient modulation for noise-robust speech separation.

Firstly, we build a unified network with multi-task learning for optimization, where front-end SE module is supervised by parallel clean mixture to reduce noise for back-end speech separation:

<img width="900" alt="1" src="https://user-images.githubusercontent.com/90536618/196723450-e190b120-101b-4107-afe3-e6a246dae9af.png">

Figure: The overall architecture of our proposed unified network, which consists of an encoder, a SE network, a SS network and a decoder. The $x_n$ denotes noisy mixture, $x_c$ denotes parallel clean mixture, $s_1$ and $s_2$ denote the target sources. The $G$ denotes gradient.

Furthermore, in order to prevent SE from suppressing valid speaker information while reducing noise, we propose a gradient modulation strategy to harmonize SE and SS tasks from the optimization view:

<div align=center>
<img width="290" alt="2" src="https://user-images.githubusercontent.com/90536618/196723812-da843f8e-faa5-4418-a313-d7f3887f5d34.png">
</div>

Figure (a): If $G_\text{SE}$ conflicts with $G_\text{SS}$ (i.e., the angle between them is larger than $90^\circ$), we set the updated $G_\text{SE}^{gm}$ as the projection of $G_\text{SE}$ on the normal plane of $G_\text{SS}$;

Figure (b): If $G_\text{SE}$ is aligned with $G_\text{SS}$, which means no conlfict, we safely set $G_\text{SE}^{gm}$ equals to $G_\text{SE}$.

## Performance

Our proposed approach has achieved the state-of-the-art on [LibriMix](https://github.com/JorisCos/LibriMix) dataset.

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

## Usage

Our code implementation is based on [SpeechBrain](https://github.com/speechbrain/speechbrain). Please kindly use the following commands for installation:
 ```bash
git clone https://github.com/YUCHEN005/Unified-Enhance-Separation.git
cd Unified-Enhance-Separation
pip install -r requirements.txt
pip install -e .
 ```

In our folder, the running scripts are at `recipes/LibriMix/separation/`, and the network code are at `speechbrain/lobes/models/`.

To start training or inference, please run following command to enter the experiment folder:

```bash
cd recipes/LibriMix/separation/
```

We provide some running scripts there in the format of `${phase}_${backbone}_${data}_${method}.sh`, where `${phase}` is selected from `['train', 'test']`, `${backbone}` is selected from `['dprnn', 'sepformer']`, and `${data}` is selected from `['libri2mix', 'libri3mix']`. `${method}` is selected from `['unified', 'unified_gm']`, where `'unified'` denotes employing unified network only, and `'unified_gm'` denotes further applying gradient modulation strategy.

The corresponding configuration files are provided in `recipes/LibriMix/separation/hparams/` with similar names.

The core code of our approach can be found in `recipes/LibriMix/separation/train_unified_gm.py`:

- Unified network: line 87-108 [[link]](https://github.com/YUCHEN005/Unified-Enhance-Separation/blob/master/recipes/LibriMix/separation/train_unified_gm.py#L87)

- Gradient modulation: line 257-294 [[link]](https://github.com/YUCHEN005/Unified-Enhance-Separation/blob/master/recipes/LibriMix/separation/train_unified_gm.py#L257)


