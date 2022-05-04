
%load .mat file that contains readDicom matrice

%figure,imagesc(readDicom), colormap bone, title('Original Image'),

BW= edge(readDicom,'canny');
                    [H, theta, rho] = hough(BW);
                    P = houghpeaks(H,1); % locates peaks in the Hough transform matrix
                    %P = houghpeaks(H,2);
                    thetaPeak = theta(P(1,2));
                    dicomRotate2 = imrotate(readDicom,thetaPeak);
                    BW2= edge(dicomRotate2,'canny');
                    
                    BW_L = bwlabel(BW2);
                    BW_P = regionprops(BW_L,'Area','majoraxislength','eccentricity');
                    
   %figure,imagesc(H), title('hough transfrom')
   
%    figure,subplot(1,2,1),imagesc(readDicom), title('Original Image'),
% subplot(1,2,2),imagesc(H),colormap hot, title('Hough Transfrom');

 figure,imagesc(readDicom),title('Original Image'),colormap(gca,bone);
 figure,imagesc(H),title('Hough Transfrom'),xlabel('\theta'), ylabel('\rho');
 axis on, axis normal, hold on;
 colormap(gca,hot);


%bone