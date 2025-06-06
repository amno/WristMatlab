# Wrist Fractures Analysis as observed with X-ray imaging
This space is a space to save my research study to process X-ray images using Matlab as wrist x-ray dicom image as case example.

The title of my submitted PhD thesis is **Wrist Fractures Analysis as observed with X-ray imaging**.

This space is my PhD works repository. Many files here are purely experimental. 
Files and Folders are still not in a good arrangement yet.
At the moment, this space has not captured all of my works yet but will progressively be updated later. 

## Project Structure

This repository is organized into several main directories, each serving a specific purpose in the research study:

*   **ACNN**: Contains experiments and implementations related to Convolutional Neural Networks (CNNs) for wrist fracture analysis.
*   **BasicImageOperations**: Includes scripts and functions for fundamental image processing tasks.
*   **CAM**: Holds code and results related to Class Activation Mapping, used for visualizing CNN decision-making.
*   **CityImageResearch2020**: Contains materials related to a specific research project or publication from 2020, possibly involving urban imagery or a similar domain.
*   **DataExplorations**: Includes scripts and notebooks for initial data analysis, visualization, and understanding of the datasets.
*   **ExeterUniDatasetBasedGtruthLabels**: Contains ground truth labels or annotations based on a dataset from Exeter University.
*   **ImageConvertToMatFiles**: Scripts for converting image files into .mat format, commonly used in Matlab.
*   **ImagesMDPI\_sensorsJournal**: Contains images and related materials for a publication in the MDPI Sensors journal.
*   **InceptionResneV2\_Wrist\_MuraNewstructuredDatasetKappaMiniBatch32AdamOptimiser**: Specific experiment using InceptionResNetV2 architecture on the MURA dataset, detailing parameters like batch size and optimizer.
*   **LearnDicom**: Resources and scripts for understanding and processing DICOM files, the standard format for medical images.
*   **MIUA2019**: Materials related to a presentation or publication at the Medical Image Understanding and Analysis (MIUA) conference in 2019.
*   **MIXEDCLAHEMuraUpdatedDetails**: Experiments involving Contrast Limited Adaptive Histogram Equalization (CLAHE) on the MURA dataset, with updated details.
*   **MURA\_RESULTS**: Stores results obtained from experiments on the MURA dataset.
*   **PixelLabelData**: Contains data related to pixel-level labeling or segmentation tasks.
*   **TestGtruth**: Ground truth data used for testing and evaluation of models.
*   **XrayAnalysis**: General scripts and tools for X-ray image analysis.

## Usage

The code in this repository is primarily written in MATLAB. Therefore, a MATLAB environment is required to run the scripts and reproduce the experiments.

Due to the experimental nature of this PhD work, many scripts are designed for specific analyses or datasets. For detailed instructions on how to run a particular piece of code, please refer to the comments and documentation within the individual script files.

General steps to use the code would typically involve:
1.  Ensuring you have MATLAB installed.
2.  Cloning or downloading this repository.
3.  Navigating to the specific directory of interest (see "Project Structure" for an overview).
4.  Opening the MATLAB scripts and reviewing their initial comments for specific dependencies, required data formats, or execution steps.
5.  Running the scripts from the MATLAB environment.

## Dependencies

The primary dependency for this project is:
*   **MATLAB**: The code is developed and tested using MATLAB. A licensed version of MATLAB is required.

Additionally, specific scripts may rely on MATLAB toolboxes such as:
*   Image Processing Toolbox™
*   Deep Learning Toolbox™
*   Statistics and Machine Learning Toolbox™

It is recommended to check the comments within individual scripts for any specific toolbox requirements.

Several publications have been produced based on works saved in this space: 
1.  A. Ananda, K. M. Knapp, A. Appelboam, E. Alonso and C. C. Reyes-Aldasoro, 'Digital Image Analysis of Distal Radius Fractures X-Ray for Manipulation under Anaesthesia', Poster session, in the 23rd Medical Image Understanding and Analysis (MIUA) conference, Jul.2019.
2.  A. Ananda, C. Karabağ, A. Ter-Sarkisov, E. Alonso, and C. C. Reyes-Aldasoro, ‘Radiography Classification: A Comparison between Eleven Convolutional Neural Networks’, in 2020 Fourth International Conference on Multimedia Computing, Networking and Applications (MCNA), Oct. 2020, pp. 119–125. doi: https://doi.org/10.1109/MCNA50957.2020.9264285.
3. C. C. Reyes-Aldasoro, K. H. Ngan, A. Ananda, A. d’Avila Garcez, A. Appelboam, and K. M. Knapp, ‘Geometric semi-automatic analysis of radiographs of Colles’ fractures’, PLOS ONE, vol. 15, no. 9, p. e0238926, Sep. 2020, doi: https://doi.org/10.1371/journal.pone.0238926.
4. A. Ananda.; Ngan, K.H.; Karabağ, C.; Ter-Sarkisov, A.; Alonso, E.; Reyes-Aldasoro, C.C. Classification and Visualisation of Normal and Abnormal Radiographs; A Comparison between Eleven Convolutional Neural Network Architectures. Sensors 2021, 21, 5381. https://doi.org/10.3390/s21165381

The Wrist X-ray images were taken from the MURA data set that could be accessed publicly but by request. This data set has published its information in an article as citation below:

P. Rajpurkar et al., ‘MURA: Large Dataset for Abnormality Detection in Musculoskeletal Radiographs’, arXiv:1712.06957 [physics], Dec. 2017, Accessed: Jul. 30, 2019. [Online]. Available: http://arxiv.org/abs/1712.06957

## Visual Examples

| Image 1 | Image 2 |
|---|---|
| <img src="https://user-images.githubusercontent.com/4032167/184920305-10a3ac35-3cb4-4a9a-8649-9de7c21993ac.jpg" alt="CAMKarenCLAHEExp" width="400px"> | <img src="https://user-images.githubusercontent.com/4032167/184920488-81c4187b-4534-4e70-966f-cc9b3e1f96b8.jpg" alt="CAM_PA_metalPlatted" width="400px"> |
| <img src="https://user-images.githubusercontent.com/4032167/184920600-0fb453b9-183d-4850-bc05-f07893bc2dfa.jpg" alt="CAM_LA_colles2" width="400px"> | <img src="https://user-images.githubusercontent.com/4032167/184920667-d6e34e31-1c82-49c8-a7da-605717a0df3c.jpg" alt="CAM_LA_metalPlatted" width="400px"> |
