%drawGroundTruthXray


%% Read the files that have been stored in the current folder
%baseDir             = 'DICOM_MATLAB/DICOM_Karen/';

%XrayDir             = dir('DICOM_MATLAB/*_PA_*.mat');
%baseDir = 'C:\Users\aczf102\Documents\MATLAB\DICOM_Karen_ANDUpdate\LA\';
baseDir = 'C:\Users\aczf102\Documents\MATLAB';
%XrayDir             = dir(strcat(baseDir,'*_PA_*.mat')); %this is only for PA data
%XrayDir             = dir(strcat(baseDir,'*_Lateral.mat'));
XrayDir             = dir(strcat(baseDir,'Tes5.mat'));
numXrays            = size(XrayDir,1);


%% Read the file, this can be done iteratively by changing "k"

k=5; % to proceed next data image, use the right-click button,then click “Increment Value and Run Section”
%currentFile         = strcat('DICOM_MATLAB/',XrayDir(k).name);
currentFile         = strcat(baseDir,XrayDir);
clear               Xray Xray_info Xray_mask Xray_RGB LM_Y LM_X
currentData         = load(currentFile);
% allocate to current variables that will be used for saving later on
%Xray                = currentData.Xray;
Xray                = currentData.readDicom;
Xray_info           = currentData.infoDicom;
[rows,cols,levs]    = size(Xray);

% If there is already a mask, read it if not, create with zeros
if isfield(currentData,'Xray_mask')
    Xray_mask       = currentData.Xray_mask;
    
else
    Xray_mask       = zeros(size(Xray));
end

% Display the PA Xray from the MATLAB file

figure
displayXrayWithMask_Exp
zoom on
% The figure is displayed, you can zoom if necessary


%% Select points, 
%       1 - lowest of the lunate, 
%       2 - edge of the radial
%       3 - centre of middle finger
[selectPoints]      = input('Select 3 landmark points? (1 - yes/0 - no)');
while selectPoints==1   
    
    XL              = get(gca,'xlim');
    YL              = get(gca,'ylim');

    Xray_mask       = zeros(size(Xray));
    [LM_Y,LM_X]     = ginput(3);
    displayXrayWithMask; 
    if (diff(XL)==cols)&(diff(YL)==rows)
        axis([ 0.9*min(LM_Y) 1.1*max(LM_Y) 0.9*min(LM_X) 1.1*max(LM_X)])
    else
        axis([XL(1) XL(2) YL(1) YL(2)])
    end
    [selectPoints]  = input('Repeat landmark points? (1 - yes/0 - no)');
end



%% Save the new file with the Xray, Xray_info (dicom) and mask
save(currentFile,'Xray','Xray_info','Xray_mask');
clear               Xray Xray_info Xray_mask Xray_RGB LM_Y LM_X rows cols levs XL YL selectPoints drawMask current*
close 
%% Save the new file with the Xray, Xray_info (dicom) and mask


%% Draw mask over a region of interest
% %drawMask =1;
% [drawMask]= input('Draw a mask? (1 - yes/0 - no)');
% while drawMask==1   
%     XL = get(gca,'xlim');
%     YL = get(gca,'ylim');
% 
%     Xray_mask = roipoly();
%     displayXrayWithMask; 
%     axis([XL(1) XL(2) YL(1) YL(2)])
%     [drawMask]= input('Repeat mask? (1 - yes/0 - no)');
% end



