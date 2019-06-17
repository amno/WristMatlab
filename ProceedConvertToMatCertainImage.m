
% clc
 clear all;
 close all;

%%
baseDir = 'C:\Users\aczf102\Documents\MATLAB';
% baseDir     = 'D:\OneDrive - City, University of London\Acad\Research\Exeter_Fracture\DICOM';
ChooseDir = input('Please choose folder to proceed, 0 for Normal, 1 for Patient : ');

if ChooseDir == 0
    PatientsDir = strcat(baseDir,filesep,'Data\Normals',filesep);
    dir0    = dir(strcat(PatientsDir,'N*'));
else
    PatientsDir = strcat(baseDir,filesep,'Data\Patients',filesep);
    % read the first folder, use "T" as the first name is always TRANCHE
    dir0    = dir(strcat(PatientsDir,'T*'));
end

numFolders_0 = size(dir0,1);

%%

for counter_0=1:numFolders_0
    % loop over folder like PAT1
    disp(strcat('----',PatientsDir,dir0(counter_0).name,'----'))
    dir1                    = dir(strcat(PatientsDir,dir0(counter_0).name,filesep,'P*'));
    numFolders_1            = size(dir1,1);
    for counter_1=1:numFolders_1
        %disp(strcat(PatientsDir,dir0(counter_0).name,filesep,dir1(counter_1).name)); %show path that being read in level Pxx
        dir2 = dir(strcat(PatientsDir,dir0(counter_0).name,filesep,dir1(counter_1).name,filesep,'ST*'));
        numFolders_2=size(dir2,1);
        for counter_2=1:numFolders_2
            disp(strcat(PatientsDir,dir0(counter_0).name,filesep,dir1(counter_1).name,filesep,dir2(counter_2).name));
            dir3=dir(strcat(PatientsDir,dir0(counter_0).name,filesep,dir1(counter_1).name,filesep,dir2(counter_2).name,filesep,'SE*'));
            numFolders_3=size(dir3,1);
            for counter_3=1:numFolders_3
                disp(strcat(PatientsDir,dir0(counter_0).name,filesep,dir1(counter_1).name,filesep,dir2(counter_2).name,filesep,dir3(counter_3).name));
                dir4= dir(strcat(PatientsDir,dir0(counter_0).name,filesep,dir1(counter_1).name,filesep,dir2(counter_2).name,filesep,dir3(counter_3).name,filesep,'IMG*'));
                numFolders_4=size(dir4,1);
                for counter_4=1:numFolders_4
                    disp(strcat(PatientsDir,dir0(counter_0).name,filesep,dir1(counter_1).name,filesep,dir2(counter_2).name,filesep,dir3(counter_3).name,filesep,dir4(counter_4).name))
                    readDicom=dicomread(strcat(PatientsDir,dir0(counter_0).name,filesep,dir1(counter_1).name,filesep,dir2(counter_2).name,filesep,dir3(counter_3).name,filesep,dir4(counter_4).name));
                    infoDicom=dicominfo(strcat(PatientsDir,dir0(counter_0).name,filesep,dir1(counter_1).name,filesep,dir2(counter_2).name,filesep,dir3(counter_3).name,filesep,dir4(counter_4).name));
                    
                    % This inversion is only necessary for those images
                    % which have a bright background, if they have a dark
                    % background it is not necessary.
                    if strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME2')
                        readDicom1= max(readDicom(:))- readDicom;
                    elseif strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME1')
                        readDicom1 = readDicom;
                    else
                        disp('undefined value');
                        exit();
                    end
                                        
                    %alignImage
                    [HoughBones,HoughAngles,HoughDist]  = hough(readDicom,'Theta',-90:1:(90-1)); 
                    PeaksHough                  = houghpeaks(HoughBones,2,'threshold',ceil(0.3*max(HoughBones(:))));
                    angleRot                    = median(HoughAngles(PeaksHough(:,2)));
                    dicomRotate                 = imrotate(readDicom,angleRot);
                    
                    %show image from readDicom
                    figure,imagesc(readDicom),title('Raw Dicom Image')
                    grid on
                    colormap bone
                                  
                    %show image to be cropped
                    figure,imagesc(readDicom1),title('Processed Dicom Image')
                    
                    [Cr,rect]=imcrop(readDicom1); %cropped region of interest
                    % Cr is Cropped area in the return variable Cr
                    % rect is variable that save the four-element position vector or cropped
                    % rectangle
                    
                    figure,imagesc(Cr),title('Cropped Image')
                    colormap bone
                    
                    %select region of interest for mask
                    maskDicom=roipoly();
                   
                    % boundary of selected mask by roipoly
                    boundaryDicom= boundarymask(maskDicom);
                    figure,imshow(boundaryDicom),title('Mask Boundary')
                    
                    % determine the edge of cropped image
                    EdgeIm=edge(Cr,'Prewitt');
                    
                    % determine the edge of cropped image
                    EdgeIm2=edge(Cr,'Canny');
                    
                    %merge mask image with cropped dicom image
                    mixedImg = Cr.* uint16(maskDicom);
                    
                   
                                    
                   
                    %save ReadDicom, infoDicom and maskDicom into .mat file
                    if ChooseDir == 0
                        saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\Exp\Normals\ANON_N_');
                        save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','maskDicom');
                        %close all;
                    else
                        saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\Exp\Patients\ANON_P_');
                        save([saveDir infoDicom.PatientID ],'readDicom','infoDicom','maskDicom');
                        %close all;
                    end
                
                                  
                    %subplot the results
                    figure, 
                    subplot(2,3,1), imagesc(readDicom), colormap bone, title('Original Image');
                    subplot(2,3,2), imagesc(dicomRotate), colormap bone, title('Align Image');
                    subplot (2,3,3),imagesc(Cr),colormap bone, title('Cropped Image');
                    subplot(2,3,4), imshow(EdgeIm), title('Edge of Cropped Image');
                    subplot(2,3,5),imshow(maskDicom),title('Mask Image');
                    subplot(2,3,6),imagesc(mixedImg),colormap bone, title(' Mask and Cropped Dicom Image merged'); 
                    
                
                end
            end
        end
    end
end






