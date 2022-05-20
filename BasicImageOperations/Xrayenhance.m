
%S =imread('C:\Users\aczf102\Documents\MATLAB\image1.png');
S=dicomread('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\IMG0');
w1=fspecial('unsharp',0.2);                 %sharpening matrix
w2=1/9*ones(3,3);                           %averaging matrix
P=S;                                 
figure(1),imshow(P),title('Raw Image')      %original image
P=histeq(P);                                %histogram equalization
%figure(2),imshow(P)
P=ordfilt2(P,1,ones(3,3),'symmetric');      %min filter
%figure(3),imshow(P)
P=imcomplement(P);                          %negative
%figure(4),imshow(P)
P=imfilter(P,w1,'replicate');               %sharpening filter
%figure(5),imshow(P)
P=histeq(P);                                %histogram equalization
%figure(6),imshow(P)
P=imfilter(P,w2,'replicate');               %mean filter
%figure(7),imshow(P)
P=ordfilt2(P,9,ones(3,3),'symmetric');      %max filter
%figure(8),imshow(P)
[r, c] = size(P);
P=adapthisteq(P,'NumTiles',[round(r/10) round(c/10)],'ClipLimit',0.03);
figure(9),imshow(P),title('Enhanced Image') %final image