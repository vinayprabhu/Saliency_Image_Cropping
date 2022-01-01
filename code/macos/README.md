# Apple Saliency API

This folder contains a Swift playground with code to experiment with Apple's
image saliency API.

It includes the code to generate the experimental data for the WACV 2022 paper
entitled "Auditing saliency cropping algorithms."

## How to use

```
git clone https://github.com/vinayprabhu/Saliency_Image_Cropping.git
open Saliency_Image_Cropping/code/macos/AppleSaliency.playground
```

This requires a new-enough version of Xcode. It was tested with Xcode 13.2.1.

## Code overview

Running the playground will run some examples through Apple's attention-based
saliency API.

First, it runs image saliency on the infamous Obama-Mcconnell image from
Twitter and writes the output to `test_saliency.csv`. Second, it runs image
saliency on the 336 images contained in `url_all.csv`. Finally, if there is a
directory named `dir_raw_images` in the playground shared data directory, it
will run on all of those images as well.

You can see the images being processed if you click to view the output of the
`drawSaliencyHeatmap()` call in `processURL()`. It will also print the results
to the console as each image is processed.

## Results format

The CSV files containing the results are all written to the playground shared
data directory. The playground shared data directory varies depending on your
simulator, but for each CSV file, it will print the full path to the console.

The columns of the CSV are as follows:
1. The URL of the image
2. The confidence of the prediction, normalized to [0, 1.0]. See https://developer.apple.com/documentation/vision/vnobservation/2867220-confidence.
3. The minimum X coordinate of the saliency rectangle, as returned by Apple's API.
4. The minimum Y coordinate of the saliency rectangle, as returned by Apple's API.
5. The maximum X coordinate of the saliency rectangle, as returned by Apple's API.
6. The maximum Y coordinate of the saliency rectangle, as returned by Apple's API.
7. A string containing the full 68x68 matrix of all saliency values. Thus, there are 68*68=4624 floating point values in the string, in array format.
