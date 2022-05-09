%readData = dicomread('C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT10\STD1\SER2\IMG0');
%%LA
%close all;
%readData = dicomread('C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT8\STD1\SER1\IMG0');
%%LA

%readData = dicomread('C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT11\STD1\SER1\IMG0');
%LA

readData = dicomread('C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT10\STD1\SER2\IMG0'); %PA

BW= edge(readData,'canny');
BW_L = bwlabel(BW);
BW_P = regionprops(BW_L,'Area','majoraxislength','eccentricity');

%imagesc(BW_L)
% BW_P = regionprops(BW_L,'Area');
% imagesc(ismember(BW_L,find([BW_P.Area]>10)))
% imagesc(ismember(BW_L,find([BW_P.Area]>100)))
%imagesc(ismember(BW_L,find([BW_P.Area]>220)))

% BW_P = regionprops(BW_L,'Area','majoraxislength');
% imagesc(ismember(BW_L,find([BW_P.MajorAxisLength]>10)))
% imagesc(ismember(BW_L,find([BW_P.MajorAxisLength]>20)))
% imagesc(ismember(BW_L,find([BW_P.MajorAxisLength]>50)))
% imagesc(ismember(BW_L,find([BW_P.MajorAxisLength]>80)))

% imagesc(ismember(BW_L,find([BW_P.Eccentricity]>0.9)))
% imagesc(ismember(BW_L,find([BW_P.Eccentricity]>0.95)))
%imagesc(ismember(BW_L,find([BW_P.Eccentricity]>0.99)))

%start rotate

[H, theta, rho] = hough(BW);
P = houghpeaks(H,2); %locates peaks in the hough matrix of H and 2 is number of peaks to identify

thetaPeak = theta(P(1,2)); %

rotateData = imrotate(readData,thetaPeak);  

BW2= edge(rotateData,'canny');
BW_L2 = bwlabel(BW2);
BW_P2 = regionprops(BW_L2,'Area','majoraxislength','eccentricity');


figure,
subplot(2,4,1), imagesc(BW_L),colormap bone, title('label connected Ori Image') ;
subplot(2,2,2), imagesc(ismember(BW_L,find([BW_P.Area]>220))),colormap bone, title('ImageProp Area') ;
subplot(2,2,3), imagesc(ismember(BW_L,find([BW_P.MajorAxisLength]>80))),colormap bone, title('ImageProp MjAxLe') ;
subplot(2,2,4), imagesc(ismember(BW_L,find([BW_P.Eccentricity]>0.99))),colormap bone, title('ImageProp Eccent') ;


figure, 
subplot(1,2,1), imagesc(readData),colormap bone, title('original dicom');
subplot(1,2,2), imagesc(rotateData),colormap bone, title('dicom rotated'); 


figure, 
subplot(1,3,1), imagesc(rotateData),colormap bone, title('dicom rotated');
subplot(1,3,2), imagesc(ismember(BW_L2,find([BW_P2.Area]>220))),colormap bone, title('Rotated ImageProp Area') ;
subplot(1,3,3), imagesc(ismember(BW_L2,find([BW_P2.Eccentricity]>0.99))),colormap bone, title('ImageProp Eccent') ;

%figure, imagesc()

