## Overview of Code

To learn preprocessing techniques, an in house CT scan was conducted on a beef bone shank. The results of the processing techniques are provided here.

_process_imagesCBT:_  Load .tif file format into MATLAB, reads each file and processes them using the _pipeline_skel.m_ specifications and saves under file 'OutputRGB'.

Main objective is to develop better image clarity for edge detection.
Test for contrast correction: explore adaptive equalization, and noise filtering using Wiener filter, anisotropic filter.
Using Otsu Binarization enhances edge detection to get a final output processed image.

The SSIM value using default anisotropic diffusion is 0.129.  
The SSIM value using quadratic anisotropic diffusion is 0.968.


##Visual Results
This process is performed and demonstrated using _Test_light methods.m_ file. Generated images and figures are linked in “Preprocessing CBCT Images”.


