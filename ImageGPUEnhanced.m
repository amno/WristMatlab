imOriginal = imread('image4.png');
imshow(imOriginal)
imGPUoriginal = gpuArray(imOriginal);
imGPUgray = rgb2gray(imGPUoriginal);
imtool(gather(imGPUgray));
imWaterGPU = imGPUgray<70;
figure
imshow(imWaterGPU)
imWaterMask = imopen(imWaterGPU,strel('disk',10));
imshow(imWaterMask)
imGPUenhanced = im2single(imGPUoriginal);
blueChannelOriginal = imGPUenhanced(:,:,3);
blueChannelEnhanced = blueChannelOriginal + 0.2*single(imWaterMask);
blueChannelEnhanced = rescale(blueChannelEnhanced);
imGPUenhanced(:,:,3) = blueChannelEnhanced;
imshow(imGPUenhanced)
title('Enhanced Image using GPU')
outCPU = gather(imGPUenhanced);
imwrite(outCPU,'image4GPUEnhanced.png')