clc;
info = dicominfo('IMG0');
Y = dicomread(info);
figure
imshow(Y,[]);
