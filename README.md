# Unifying Speech Enhancement and Separation with Gradient Modulation for End-to-End Noise-Robust Speech Separation

## Introduction



<img width="900" alt="1" src="https://user-images.githubusercontent.com/90536618/196723450-e190b120-101b-4107-afe3-e6a246dae9af.png">

The figure above illustrates the overall architecture of our proposed unified network, which consists of an encoder, a SE network, a SS network and a decoder. The $x_n$ denotes noisy mixture, $x_c$ denotes parallel clean mixture, $s_1$ and $s_2$ denote the target sources. The $G$ denotes gradient.

<div align=center>
<img width="320" alt="2" src="https://user-images.githubusercontent.com/90536618/196723812-da843f8e-faa5-4418-a313-d7f3887f5d34.png">
</div>

Figure (a): If $G_\text{SE}$ conflicts with $G_\text{SS}$ (i.e., the angle between them is larger than $90^\circ$), we set the updated $G_\text{SE}^{gm}$ as the projection of $G_\text{SE}$ on the normal plane of $G_\text{SS}$;

Figure (b): If $G_\text{SE}$ is aligned with $G_\text{SS}$, which means no conlfict, we safely set $G_\text{SE}^{gm}$ equals to $G_\text{SE}$.


## Usage

Our code implementation is based on [SpeechBrain](https://github.com/speechbrain/speechbrain). Kindly use the following commands for installation:
 ```bash
git clone https://github.com/YUCHEN005/Unified-Enhance-Separation.git
cd speechbrain
pip install -r requirements.txt
pip install -e .
 ```

In our folder, the running scripts are at `egs2/rats_chA/asr_with_enhancement/{run_rats_chA_gradient_remedy, rats_chA_gradient_remedy}.sh`, the network code are at `espnet2/{asr/, enh/, layers/}`, and the optimization code are at `espnet2/train/`.

**Tips**: 

1. To go over the entire project, please start from the script `egs2/rats_chA/asr_with_enhancement/run_rats_chA_gradient_remedy.sh` [[link]](https://github.com/YUCHEN005/Gradient-Remedy/blob/master/egs2/rats_chA/asr_with_enhancement/run_rats_chA_gradient_remedy.sh)
2. To read the core code of Gradient Remedy, please refer to the script `espnet2/train/trainer_gradient_remedy.py` (line 455-475) [[link]](https://github.com/YUCHEN005/Gradient-Remedy/blob/master/espnet2/train/trainer_gradient_remedy.py#L455)


