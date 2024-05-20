# Overview
Generated synthetic ultrasound images using the MUST toolbox, aligning them with real-world coordinates from gyrascope data to match locations accurately. It then loops through different tilt angles to simulate ultrasound at each angle, integrating the generated ultrasound with CBCT data for medical imaging.

## Ultrasound generation and coordinate set-up
Configure parameters for ultrasound simulation, such as adjusting the transmission apodization technique and defining tilt angles for simulated ultrasound waves to then create a synthetic ultrasound images from the imported CBCT data.

## Real time demonstration output
The script iterates through a loop to simulate ultrasound images at different time points, which is common practice for tracking changes over time. Each iteration includes preprocessing CBCT images, generating scatterers (representing acoustic properties), simulating ultrasound RF signals, and applying beamforming techniques to produce ultrasound images.

Looped video and rotations to demonstraight the alignment can be viewed in the "Alignment and rotation videos" folder.

## Refrences
MATLAB Ultrasound Toolbox (MUST):
1) D. Garcia, 
"Make the most of MUST, an open-source MATLAB UltraSound Toolbox," 
2021 IEEE International Ultrasonics Symposium (IUS), 2021, pp. 1-4, 
doi: 10.1109/IUS52206.2021.9593605.

2) D. Garcia, 
"SIMUS: an open-source simulator for medical ultrasound imaging. Part I: theory & examples," 
Computer Methods and Programs in Biomedicine, 218, 2022, p. 106726, 
doi: 10.1016/j.cmpb.2022.106726.

3) A. Cigier, F. Varray and D. Garcia, 
"SIMUS: an open-source simulator for medical ultrasound imaging. Part II: comparison with four simulators," 
Computer Methods and Programs in Biomedicine, 218, 2022, p. 106774, 
doi: 10.1016/j.cmpb.2022.106774.

