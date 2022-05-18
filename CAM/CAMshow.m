function CAMshow(im,CAM)
  imSize = size(im);
  CAM = imresize(CAM,imSize(1:2));
  CAM = normalizeImage(CAM);
  CAM(CAM < .2) = 0;
  cmap = jet(255).*linspace(0,1,255)';
  %'
  CAM = ind2rgb(uint8(CAM*255),cmap)*255;

  combinedImage = double(rgb2gray(im))/2 + CAM;
  combinedImage = normalizeImage(combinedImage)*255;
  imshow(uint8(combinedImage));
  figure,imhist(uint8(combinedImage));
end

function N= normalizeImage(I)
  minimum = min(I(:));
  maximum = max(I(:));
  N = (I-minimum)/(maximum-minimum);
end

