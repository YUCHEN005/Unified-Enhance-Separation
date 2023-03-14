# Unifying Speech Enhancement and Separation with Gradient Modulation for End-to-End Noise-Robust Speech Separation

[Unifying Speech Enhancement and Separation with Gradient Modulation for End-to-End Noise-Robust Speech Separation](https://arxiv.org/abs/2302.11131)

Note: The code is currently under maintenance, we will make it available asap. We apologize for inconvenience it may cause.

## Introduction

We propose a novel network to unify speech enhancement and separation with gradient modulation for noise-robust speech separation.

Firstly, we build a unified network with multi-task learning for optimization, where front-end SE module is supervised by parallel clean mixture to reduce noise for back-end speech separation:

<img width="900" alt="1" src="https://user-images.githubusercontent.com/90536618/196723450-e190b120-101b-4107-afe3-e6a246dae9af.png">

Figure: The overall architecture of our proposed unified network, which consists of an encoder, a SE network, a SS network and a decoder. The $x_n$ denotes noisy mixture, $x_c$ denotes parallel clean mixture, $s_1$ and $s_2$ denote the target sources. The $G$ denotes gradient.

Furthermore, in order to prevent SE from suppressing valid speaker information while reducing noise (i.e., over-suppression problem, as analyzed in [prior work](https://arxiv.org/abs/2110.05267)), we propose a gradient modulation strategy to harmonize SE and SS tasks from the optimization view:

<div align=center>
<img width="290" alt="2" src="https://user-images.githubusercontent.com/90536618/196723812-da843f8e-faa5-4418-a313-d7f3887f5d34.png">
</div>

Figure (a): If $G_\text{SE}$ conflicts with $G_\text{SS}$ (i.e., the angle between them is larger than $90^\circ$), we set the updated $G_\text{SE}^{gm}$ as the projection of $G_\text{SE}$ on the normal plane of $G_\text{SS}$;

Figure (b): If $G_\text{SE}$ is aligned with $G_\text{SS}$, which means no confict, we safely set $G_\text{SE}^{gm}$ equals to $G_\text{SE}$.

If you find this work useful in your research, please kindly use the following BibTeX entry for citation:

```bash
@article{hu2023unifying,
  title={Unifying Speech Enhancement and Separation with Gradient Modulation for End-to-End Noise-Robust Speech Separation},
  author={Hu, Yuchen and Chen, Chen and Zou, Heqing and Zhong, Xionghu and Chng, Eng Siong},
  journal={arXiv preprint arXiv:2302.11131},
  year={2023}
}
```
