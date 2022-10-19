# Unifying Speech Enhancement and Separation with Gradient Modulation for End-to-End Noise-Robust Speech Separation

## Introduction

Gradient Remedy is a novel method to solve the gradient interference problem in multi-task learning for noise-robust ASR, i.e., conflicting gradients and wrongly dominant gradients.
It has improved the ASR performance on [Robust Automatic Transcription of Speech (RATS)](https://github.com/YUCHEN005/RATS-Channel-A-Speech-Data) and [CHiME-4](https://spandh.dcs.shef.ac.uk/chime_challenge/CHiME4/data.html) datasets.

<div align=center>
<img width=470 src="https://user-images.githubusercontent.com/90536618/196681399-f093065a-3451-4d9d-b950-394c96625f20.png">
</div>

Figure (a): Multi-task learning of speech enhancement (SE) and automatic speech recognition (ASR);

Figure (b): In case the SE and ASR gradients are conflicting (i.e., the angle between them is larger than $90^\circ$), we project the SE gradient onto a dynamic surface at acute angle $\theta$ to ASR gradient, in order to 1) remove conflict and 2) push SE gradient to assist in ASR optimization;

Figure (c): In case of wrongly dominant SE gradient (i.e., $\Vert G_\text{SE} \Vert_2 > K \cdot \Vert G_\text{ASR} \Vert_2$ , where $K>1$ is a threshold), we adaptively rescale the magnitude of two gradients to prevent dominant ASR task being misled by SE gradient.

## Usage

Our code implementation is based on [ESPnet](https://github.com/espnet/espnet). You may intall it directly using our provided ESPnet(v.0.9.6) folder, or install from official website and then add files from our repo. Kindly use the command `pip install -e .` to install ESPnet.

In our folder, the running scripts are at `egs2/rats_chA/asr_with_enhancement/{run_rats_chA_gradient_remedy, rats_chA_gradient_remedy}.sh`, the network code are at `espnet2/{asr/, enh/, layers/}`, and the optimization code are at `espnet2/train/`.

**Tips**: 

1. To go over the entire project, please start from the script `egs2/rats_chA/asr_with_enhancement/run_rats_chA_gradient_remedy.sh` [[link]](https://github.com/YUCHEN005/Gradient-Remedy/blob/master/egs2/rats_chA/asr_with_enhancement/run_rats_chA_gradient_remedy.sh)
2. To read the core code of Gradient Remedy, please refer to the script `espnet2/train/trainer_gradient_remedy.py` (line 455-475) [[link]](https://github.com/YUCHEN005/Gradient-Remedy/blob/master/espnet2/train/trainer_gradient_remedy.py#L455)


