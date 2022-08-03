---
title: Home
layout: template
filename: index
--- 

# Auditing Saliency Image Cropping

<button onclick="location.href='./paper_html/main.html'" type="button"> Read our WACV-2022 Paper (HTML) </button>

## Landscape of deployment (Updated Aug 1, 2022)
<button onclick="location.href='./landscape_html/landscape.html'" type="button"> Who is shilling this tech? </button>

## Coverage in the Feb 2022 issue of the RSIP-Vision magazine

<iframe src="/gallery/Feb2022_rsipvision.pdf" width="100%" height="500px">
</iframe>

<iframe src="https://docs.google.com/presentation/d/e/2PACX-1vQwhwiHbwW6eCiCoRTYWJ9kBzYzxwd2TWCrA7AIbqWilA9-Phiz3DKn_mnHMI2B2VtJ1Fan4DawUAOx/embed?start=false&loop=false&delayms=60000" frameborder="0" width="480" height="299" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>

# Table of Contents
- [Summary](#summary)
- [Timeline](#timeline)
- [Acknowledgements](#acknowledgements)
- [Video](#video)
- [Slides](#presentation)


## Summary
For the past year, we have been investigating this murky yet fascinating tech called _Saliency cropping_ that passively touches all our lives silently influencing the ways in which we encounter digital images on the world wide web. Sold under different monikers such as ‘_AI assisted cropping_’, ‘_Smart cropping_’ and  ‘_Content aware cropping_’, it has come to be extensively used by all the major digital content serving platforms such as Twitter, Facebook, Google, Microsoft and Apple, that seek to deliver their image-laden content on a wide array of consumption devices of varying screen sizes, aspect ratios and viewing angles. 
While Twitter had to grapple with the downstream cropping biases experienced by its users in a very [public way](https://www.theguardian.com/technology/2020/sep/21/twitter-apologises-for-racist-image-cropping-algorithm) ultimately resulting in its removal, it continues to be deployed aggressively across the other platforms. 

We created this website to catalogue all our investigative efforts spanning 15 months, 3 continents, 2 papers, and, well, 2 COVID diagnoses :( 
It captures much of our efforts in the period spanning Sep 2020 to Nov 2021 (See the [Timeline](#timeline)) during which we collaborated with computer vision researchers who have worked in this area of research and ethicists alike (See [Acknowledgements](#acknowledgements)).

In order to ensure transparency, we are sharing the reviews provided by the anonymous reviewers at the CVPR-2021 workshop and WACV [here](https://github.com/vinayprabhu/Saliency_Image_Cropping/tree/main/paper). 
In the coming week(s), we will be sharing all the code and a whole slew of experimental results that did not make it to either of our two papers. It is our goal to eventually summarize all our findings into a single monologue. If you are a researcher with relevant expertise who’d like to join hands, feel free to contact us 🤗

## Poster
<!-- ![WACV-2022 Poster](./gallery/1384-wacv-poster.svg) -->
<img src="./gallery/1384-wacv-poster.svg" alt="WACV-2022 Poster" width="480" height="299"/>

## Video
<iframe width="480" height="299" src="https://www.youtube.com/embed/BSHG0bIcNL0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Presentation
<iframe src="https://docs.google.com/presentation/d/e/2PACX-1vQwhwiHbwW6eCiCoRTYWJ9kBzYzxwd2TWCrA7AIbqWilA9-Phiz3DKn_mnHMI2B2VtJ1Fan4DawUAOx/embed?start=false&loop=false&delayms=60000" frameborder="0" width="480" height="299" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>

## Timeline

| Date 	| Event 	|
| September 19, 2020 	|  🔭Discovery on Twitter and first simple set of experiments 🔬 	|
| September 19, 2020 	|  ✍Created the [@cropping_bias](https://twitter.com/cropping_bias) Twitter account to crowd-source the instances of offensive crops that informed our experiments 	|
| September 21, 2020 	|  ✍First [blogpost](https://vinayprabhu.medium.com/on-the-twitter-cropping-controversy-critique-clarifications-and-comments-7ac66154f687) titled ‘On the Twitter cropping controversy: Critique, clarifications & comments’  	|
| October 2, 2020 	| ✍ Second [blogpost](https://vinayprabhu.medium.com/scrutinizing-saliency-based-image-cropping-6b7a70cfb4f1) on Scrutinizing Saliency-Based Image Cropping 	|
| October 9, 2020 	| A 30 min discussion with 2 members of a ‘meta-team’ within Twitter 	|
| April 2, 2021 	| 😍 ✍ First workshop paper submission to the [BeyondFairCV](https://sites.google.com/view/beyond-fairness-cv/home) workshop (as Submission 21) 	|
| May 23, 2021 	| 😎 Acceptance notification (Original decision date was Apr 23, but got postponed on account of the pandemic)  	|
| June 21, 2021 	| ✍ Submission of the camera-ready version of the paper to the organizers of the workshop 	|
| June 25, 2021 	| 🙌 Paper presentation at the [workshop](https://sites.google.com/view/beyond-fairness-cv/home) via Discord 	|
| August 11, 2021 	| ✍ Second paper submitted @ WACV-2022 (Round-2) 	|
|  October 4, 2021 	| Acceptance notification at WACV-2022  🙌 	|
| January 6, 2022 	|  😎 🎊 Paper + Poster presentation at [WACV-2022](https://wacv2022.thecvf.com/home)   	|
| February 6, 2022 	|  😎🙌  WACV 2022 paper as part of the [Feb issue](https://www.rsipvision.com/ComputerVisionNews-2022February/10/) of the RSIP vision magazine 	|
| August 1, 2022 	|  👉 Updated the landscape of current real-world deployments  	|

## Acknowledgements

This work would not have been possible without the incredible support of the following scholars:
[AbuBakar Abid (Gradio)](https://twitter.com/abidlabs),  [Ali Abdalla (Gradio)](https://twitter.com/si3luwa), [Alexander Kroner](https://scholar.google.com/citations?user=hWKtP0sAAAAJ&hl=en), [Sang Han](https://github.com/jjangsangy), [Prof. Broderick Turner](https://marketing.pamplin.vt.edu/people/faculty/turner.html), [Darrell Owens](https://twitter.com/IDoTheThinking), the organizers of the BeyondFairCV CVPR-2021 workshop, the attendees who gave us crucial feedback and all the volunteers who alerted us on various manifestations of cropping biases via our [Cropping_bias Twitter handle](https://twitter.com/cropping_bias) and help with the hand-annotations in our experiments.
