load('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Patients\LA\Monochrome2\InCategory\ANON_P_ANON3707.mat')

LAimgsOri = dicomRotate2;

figure,imagesc(LAimgsOri),colormap autumn, title('Autumn');
figure,imagesc(LAimgsOri),colormap winter,title('Winter');
figure,imagesc(LAimgsOri),colormap spring, title('Spring');
figure,imagesc(LAimgsOri),colormap summer, title('Summer');

load('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Patients\PA\Monochrome2\InCategory\ANON_P_ANON3509.mat')

PAimgsOri = dicomRotate2;
figure,imagesc(PAimgsOri),colormap autumn, title('Autumn');
figure,imagesc(PAimgsOri),colormap winter,title('Winter');
figure,imagesc(PAimgsOri),colormap spring, title('Spring');
figure,imagesc(PAimgsOri),colormap summer, title('Summer');


PAAutumn = imread('C:\Users\aczf102\OneDrive - City, University of London\Pictures\IMrsch2020\PAAutumn2.jpg');
PAWinter = imread('C:\Users\aczf102\OneDrive - City, University of London\Pictures\IMrsch2020\PAWinter2.jpg');
PASpring = imread('C:\Users\aczf102\OneDrive - City, University of London\Pictures\IMrsch2020\PASpring2.jpg');
PASummer = imread('C:\Users\aczf102\OneDrive - City, University of London\Pictures\IMrsch2020\PASummer2.jpg');

LAAutumn = imread('C:\Users\aczf102\OneDrive - City, University of London\Pictures\IMrsch2020\LAAutumn2.jpg');
LAWinter = imread('C:\Users\aczf102\OneDrive - City, University of London\Pictures\IMrsch2020\LAWinter2.jpg');
LASpring = imread('C:\Users\aczf102\OneDrive - City, University of London\Pictures\IMrsch2020\LASpring2.jpg');
LASummer = imread('C:\Users\aczf102\OneDrive - City, University of London\Pictures\IMrsch2020\LASummer2.jpg');
multi=cat(3,PAAutumn,LAWinter,PASpring,LASummer);

%figure,montage({PAAutumn,PAWinter,PASpring,PASummer,LAAutumn,LAWinter,LASpring,LASummer},[2 4]);
figure,montage({PAAutumn,LAWinter,PASpring,LASummer});
% figure,subplot(1,4,1),imshow(PAAutumn);
% subplot(1,4,2),imshow(PAWinter);
% subplot(1,4,3),imshow(PASpring);
% subplot(1,4,4),imshow(PASummer);