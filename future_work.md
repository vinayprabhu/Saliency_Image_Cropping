---
title: Future research directions
layout: template
filename: future_work
--- 


# Future research directions

If you are an academic researcher working on saliency estimation/cropping here are some questions we pondered about but do not have the bandwidth to execute on:

a) The fate of saliency cropping models initialized with a pre-trained models trained on:

 i) [Face-blurred version of the ImageNet dataset](https://github.com/princetonvisualai/imagenet-face-obfuscation).

 ii) [The PASS dataset](https://github.com/yukimasano/PASS/) (Has no human faces)

 iii) Multi-modal datasets (Ex: CLIP trained on WIT and [FaRL for Facial Representation Learning](https://github.com/microsoft/FaRL) model training on a subset of LAION-400M)

b) Repeating the experiments with other datasets from the [CFD group](https://www.chicagofaces.org/) such as CFD ver 3.0, CFD-MR, CFD-India.

c) Understanding **_WHY_** Twitter�s model had this uniquely strong fixation towards corporate logos and background text

d) Understanding the effect of model compression on downstream biases. We have repeatedly seen in our professional work that compressed models, whilst maintaining high in-distribution validation accuracies, often tend to open up enhanced vulnerability to OOD (Out of distribution) inputs

An important note on the nexus between saliency cropping bias and granular objective face-metric evaluations.

When it comes to saliency scores associated with human faces, psychonomic datasets such as CFD have detailed measurements falling into 3 categories: Sxx - Self reported measures, Rxx - Measures from independent rater sample and Pxx - Physical attribute measures (with objective measurements of metrics such as fWHR2, NoseWidth,� NoseLength etc). It is entirely possible that these face physical attribute measures might have a stronger predictive power explaining the observed biases than self-reported racial categorization. In fact, a quick literature survey reveals an entire body of work that specifically investigates this intersection between granular facial features and fixation/saliency patterns  
![](./gallery/image001.png)

But we however posit that such an undertaking has to be carried out with extreme care by a multidisciplinary team encompassing computer vision researchers, ethicists, specialist scholars from experimental psychology and psychonomics alike.