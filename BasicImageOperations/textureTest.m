%simple texture exploit

clc;clear;

I = dicomread('IMG0.dms'); 
J = rangefilt(I);
K = dicomread('IMG0_1.dms');
L = rangefilt(K);
figure,imshowpair(I,J,'montage')
figure,imshowpair(K,L,'montage')
