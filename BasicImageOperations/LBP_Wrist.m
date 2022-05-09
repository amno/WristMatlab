clc;
Wrist1 = dicomread('IMG0');
Wrist2 = dicomread('IMG0_1');
%carpet = imread('carpet.jpg'); 
figure
imshow(Wrist1,[])
title('Wrist Fracture 1')
figure
imshow(Wrist2,[])
title('Wrist Fracture 2')
figure
%imshow(carpet)
%title('Carpet')
lbpWrist1 = extractLBPFeatures(Wrist1,'Upright',false);
lbpWrist2 = extractLBPFeatures(Wrist2,'Upright',false);
%lbpCarpet = extractLBPFeatures(carpet,'Upright',false);
Wrist1VsWrist2 = (lbpWrist1 - lbpWrist2).^2;
%brickVsCarpet = (lbpBricks1 - lbpCarpet).^2;
%figure
bar(Wrist1VsWrist2,'grouped')
title('Squared Error of LBP Histograms')
xlabel('LBP Histogram Bins')
legend('Wrist1VsWrist2')
