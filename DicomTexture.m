clc;
clear;

a= dicomread('IMG0_1');
b = dicomread('IMG0');
figure, imshow(a,[]),title('original no.1')
figure, imshow(b,[]),title('original no.2')
figure
warp(a,a,256),title('texture no.1');
figure
warp(b,b,256),title('texture no.2');
figure
imhist(a),title('histogram no.1');
figure
imhist(b),title('histogram no.2');
