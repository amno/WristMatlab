%netName = 'squeezenet';
        %netName = 'googlenet';
 %net = eval(netName);
net = netTransfer;
inputSize = net.Layers(1).InputSize(1:2);
classes = net.Layers(end).Classes;
%layerName = activationLayerName(netName);
%layerName = 'activation_47_relu';
layerName = 'activation_49_relu'; %final relu

%im = imread('testWristInternet.jpeg');
im = imread('testWristInternetCollesPA.jpeg');
imResized = imresize(im,[inputSize(1),inputSize(2)]);
%imResized = cat(3,imResized,imResized,imResized);
%imResized = ind2rgb(imResized,map);
imageActivations = activations(net,imResized,layerName);

scores = squeeze(mean(imageActivations,[1 2]));
% [~,classIds] = maxk(scores,3);
% classActivationMap = imageActivations(:,:,classIds(1));

%if netName ~= "squeezenet"
        fcWeights = net.Layers(end-2).Weights;
        fcBias = net.Layers(end-2).Bias;
        scores =  fcWeights*scores + fcBias;
        
        [~,classIds] = maxk(scores,3);
        
        weightVector = shiftdim(fcWeights(classIds(1),:),-1);
        classActivationMap = sum(imageActivations.*weightVector,3);
%     else
%         [~,classIds] = maxk(scores,3);
%         classActivationMap = imageActivations(:,:,classIds(1));
%     end

scores = exp(scores)/sum(exp(scores));
maxScores = scores(classIds);
labels = classes(classIds);

figure,subplot(1,2,1);
imshow(im); title("Original Image");
subplot(1,2,2);
CAMshow(im,classActivationMap);
title(string(labels) + ", " + string(maxScores*100)+"%");

drawnow;

function layerName = activationLayerName(netName)

if netName == "squeezenet"
    layerName = 'relu_conv10';
elseif netName == "googlenet"
    layerName = 'inception_5b-output';
elseif netName == "resnet18"
    layerName = 'res5b_relu';
elseif netName == netTransfer
    layerName = 'res5b_relu';
elseif netName == "mobilenetv2"
    layerName = 'out_relu';
end

end