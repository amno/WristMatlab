load ResNet50_E_2_among_2_folds.mat
%net = detector.Network.Layers;
net = netTransfer;
inputSize = net.Layers(1).InputSize(1:2);
classes = net.Layers(end).Classes;
layerName = 'activation_49_relu'; %%resnet50
%layerName = 'conv_7b_ac';  %%inceptionresnetv2

%images for MDPI Sensor special edition journal
% Figure 2
%im = imread('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\ValidPositifMURAELBOW.png');
%im = imread('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\ValidPositifMURAForearm.png');
%im = imread('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\ValidPositifMURAHand.png');
%im = imread('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\ValidPositifMURAHumerus.png');
%im = imread('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\ValidPositifMURAShoulder.png');
%im = imread('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\ValidPositifMURAWrist_PA.png');
%im = imread('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\ValidPositifMURA_LA.png');
%im = imread('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\ValidPositifMURAFinger.png');

% Figure 1
%im = imread('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\TrainNegativeMURA_LA.png');
%im = imread('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\TrainNegativeMURAElbow.png');
%im = imread('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\TrainNegativeMURAFinger.png');
%im = imread('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\TrainNegativeMURAForearm.png');
%im = imread('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\TrainNegativeMURAHand.png');
%im = imread('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\TrainNegativeMURAHumerus.png');
%im = imread('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\TrainNegativeMURAShoulder.png'); %gives positive (abnormal) detected result
%im = imread('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\TrainNegativeMURAWrist_PA.png');

%Figure 4
 %im = imread ('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\TrueNegativePredictedNegative_LA_11279.png');
% im = imread ('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\TrueNegativePredictedPositive_LA_11281.png');
% im = imread ('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\TruePositivePredictedNegative_LA_11205.png');
% im = imread ('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\TruePositivePredictedPositive_LA_11185.png');


%Figure 5 PA position

% im = imread ('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\TrueNegativePredictedNegative_PA_11279.png');
% im = imread ('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\TrueNegativePredictedPositive_PA_11290.png');
% im = imread ('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\TruePositivePredictedNegative_PA_11205.png');
% im = imread ('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\1_Experiments\ImagesMDPI_sensorsJournal\TruePositivePredictedPositive_PA_11185.png');


%MUA anonated --> 
%im = imread('ANON3579_AP_MU.jpg');
%im = imread('ANON3739_LAT_LINES.jpg');
%im = imread('ANON3513_lat.jpg');
%im = imread('testWristInternetLateral.jpeg');
%im = readDicom;
%im = dicomRotate2;
%im= imread('image2P11215.png');
im = imread('image2HandPositive.png');
%im = dicomread('IMG1');
%im = imread('image2.png');
%im=imread('testWristInternetCollesPA.jpeg');
%im=imread('testWristInternetCollesLA.jpeg');
%im = imread('testWristInternetLateral.jpeg');

%    im = adapthisteq(im);
%    im= cat(3,im,im,im);  

imResized = imresize(im,[inputSize(1),inputSize(2)]);
imageActivations = activations(net,imResized,layerName);

scores = squeeze(mean(imageActivations,[1 2]));

        fcWeights = net.Layers(end-2).Weights;
        fcBias = net.Layers(end-2).Bias;
        scores =  fcWeights*scores + fcBias;
        
        [~,classIds] = maxk(scores,3);
        
        weightVector = shiftdim(fcWeights(classIds(1),:),-1);
        classActivationMap = sum(imageActivations.*weightVector,3);
        
 scores = exp(scores)/sum(exp(scores));
maxScores = scores(classIds);
labels = classes(classIds);

% figure('Name','Deep Learning Class Activation Mapping','NumberTitle','off'),subplot(1,2,1);
% imshow(im); title("Original Image");
% subplot(1,2,2);
% CAMshow(im,classActivationMap);
% title(string(labels) + ", " + string(maxScores*100)+"%");

figure('Name','Deep Learning Class Activation Mapping','NumberTitle','off')
CAMshow(im,classActivationMap);
title(string(labels) + ", " + string(maxScores*100)+"%");

figure('Name','Deep Learning Class Activation Mapping','NumberTitle','off')
CAMshow(im,classActivationMap);
%title(string(labels) + ", " + string(maxScores*100)+"%");


drawnow;
