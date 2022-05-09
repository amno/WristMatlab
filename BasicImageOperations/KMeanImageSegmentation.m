%K-means image segmentation 

I= imread('testWristInternetCollesPA.jpeg');

[L,Centers] = imsegkmeans(I,3);

B = labeloverlay(I,L);
figure,imshow(B)
title('Labeled Image')
