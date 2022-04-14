clc;
clear;
prompt='input degree of rotation you want ?';
x=input(prompt);
rot = dicomread('IMG0');
%prompt={'How degree of rotation you want ?'};
%title='degree value';
%x = inputdlg();
%figure, imshow(rot,[]),title('Original Projection')
RotAft= imrotate(rot,x);
%figure, imshow(RotAft,[]),title('Rotate projection of n input degree')
subplot(1,2,1), imshow(rot,[]),title('Original Projection')
subplot(1,2,2),imshow(RotAft,[]),title('Rotate projection of n input degree')