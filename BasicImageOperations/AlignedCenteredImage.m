%this is scratch code to align image position

%readData=dicomread('C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT1\STD1\SER2\IMG0');
%readData = dicomread('C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT10\STD1\SER2\IMG0');



readData = dicomread('C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT10\STD1\SER2\IMG0');
BW= edge(readData,'canny');
[H, theta, rho] = hough(BW);
P = houghpeaks(H,1);
thetaPeak = theta(P(1,2));
I3 = imrotate(readData,thetaPeak);

figure,
subplot(1,2,1),imagesc(readData),colormap bone;
subplot(1,2,2),imagesc(I3),colormap bone;


% 
% 
% 
% 
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% data anomaly 
%C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT1\STD1\SER1\IMG0
%C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT9\STD1\SER1\IMG0
%C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT13\STD1\SER1\IMG0
%C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT15\STD1\SER1\IMG0
%C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT23\STD1\SER1\IMG0
%C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT28\STD1\SER1\IMG0
%C:\Users\aczf102\Documents\MATLAB\Data\Normals\N2\PAT3\STD1\SER1\IMG0
%C:\Users\aczf102\Documents\MATLAB\Data\Normals\N2\PAT7\STD1\SER1\IMG0
%C:\Users\aczf102\Documents\MATLAB\Data\Normals\N2\PAT9\STD1\SER1\IMG0
%C:\Users\aczf102\Documents\MATLAB\Data\Normals\N2\PAT20\STD1\SER1\IMG0

%challenging but aligned well 
%C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT20\STD1\SER1\IMG0

% %maybe : C:\Users\aczf102\Documents\MATLAB\Data\Normals\N2\PAT24\STD1\SER1\IMG0
%C:\Users\aczf102\Documents\MATLAB\Data\Normals\N2\PAT27\STD1\SER1\IMG0
%C:\Users\aczf102\Documents\MATLAB\Data\Normals\N2\PAT34\STD1\SER1\IMG0
%C:\Users\aczf102\Documents\MATLAB\Data\Normals\N2\PAT35\STD1\SER1\IMG0
