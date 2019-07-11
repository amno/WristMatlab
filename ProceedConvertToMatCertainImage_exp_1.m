
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
elseif ChooseDir == 1
    PatientsDir = strcat(baseDir,filesep,'Data\Patients',filesep);
    % read the first folder, use "T" as the first name is always TRANCHE
    dir0    = dir(strcat(PatientsDir,'T*'));
else
    disp('wrong input'); 
end

numFolders_0 = size(dir0,1);
%numFolders_0 = input('Please input number of data to be processed : ');
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
                    if strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME2')  % minimum value is intended to be displayes as white
                        readDicom1= max(readDicom(:))- readDicom;
                    elseif strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME1')% minimum value is intended to be displayes as black
                        %readDicom1 = readDicom;
                        readDicom1 = min(readDicom(:))+ readDicom; %need to revise
                    else
                        disp('undefined value');
                        exit();
                    end
                    
                    
                    %alignImage vers1
                    [HoughBones,HoughAngles,HoughDist]  = hough(readDicom,'Theta',-90:1:(90-1));
                    PeaksHough                  = houghpeaks(HoughBones,2,'threshold',ceil(0.3*max(HoughBones(:))));
                    angleRot                    = median(HoughAngles(PeaksHough(:,2)));
                    dicomRotate1                 = imrotate(readDicom,angleRot);
                    
                    %alignImage vers2
                    BW= edge(readDicom,'canny');
                    [H, theta, rho] = hough(BW);
                    P = houghpeaks(H,1); % locates peaks in the Hough transform matrix
                    %P = houghpeaks(H,2);
                    thetaPeak = theta(P(1,2));
                    dicomRotate2 = imrotate(readDicom,thetaPeak);
                    BW2= edge(dicomRotate2,'canny');
                    
                    BW_L = bwlabel(BW2);
                    BW_P = regionprops(BW_L,'Area','majoraxislength','eccentricity');
                    
                    
                    %show image from readDicom
                    %                        figure,imagesc(readDicom),title('Raw Dicom Image')
                    %                         grid on
                    %                         colormap bone
                    
                    
                    % Add crop based on intensity of the box around the
                    % x-ray *** What is there is no box!?!?!?!?!?  **
                    dicomRotRemoveEdge=removeDicomEdges(dicomRotate1);
                    dicomRotRemoveEdge2=removeDicomEdges(dicomRotate2);
                    
                    
                    % pixel-value cross-sections along line segments
                    AxisX = [0 size(dicomRotRemoveEdge2,2)];
                    AxisY = [size(dicomRotRemoveEdge2,1)/2 size(dicomRotRemoveEdge2,1)/2];
                    c=improfile(dicomRotRemoveEdge2,AxisX,AxisY);
                    
                    
                    %save ReadDicom, infoDicom and other features into .mat file
                    if ChooseDir == 0
                        if strcmp(infoDicom.BodyPartExamined,'HAND')|| strcmp(infoDicom.BodyPartExamined,'WRIST')|| strcmp(infoDicom.BodyPartExamined,'ARM')||strcmp(infoDicom.BodyPartExamined,'FOREARM')
                            if strcmp(infoDicom.SeriesDescription,'PA')||strcmp(infoDicom.SeriesDescription,'AP')||strcmp(infoDicom.SeriesDescription,'WRIST PA')||strcmp(infoDicom.ViewPosition,'PA')||strcmp(infoDicom.ViewPosition,'AP')||strcmp(infoDicom.ViewPosition,'WRIST PA')||strcmp(infoDicom.ViewPosition,'AP Wireless')||strcmp(infoDicom.SeriesDescription,'AP Wireless')||strcmp(infoDicom.ViewPosition,'DP Wireless')||strcmp(infoDicom.SeriesDescription,'DP Wireless')
                                %if strcmp(infoDicom.SeriesDescription,'PA')||strcmp(infoDicom.SeriesDescription,'AP')||strcmp(infoDicom.SeriesDescription,'WRIST PA')
                                %if strcmp(infoDicom.SeriesDescription,'PA')||strcmp(infoDicom.SeriesDescription,'AP')||strcmp(infoDicom.SeriesDescription,'WRIST PA')
                                %if strcmp(infoDicom.ViewPosition,'PA')||strcmp(infoDicom.ViewPosition,'AP')||strcmp(infoDicom.ViewPosition,'WRIST PA')
                                if strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME1') %monochrome 1, and thetaPeak between -10 to 10
                                    if (thetaPeak >= -10)&& (thetaPeak <= 10)
                                        saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Normals\PA\Monochrome1\InCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PhotoMetricAndTheta\Normals\Monochrome1\InCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\ThetaAlign\Normals\ThetaInRange\ANON_N_');
                                        %save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','maskDicom');
                                        save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2');
                                        %close all;
                                        
                                        %figure,
                                        %subplot(1,2,1),imagesc(readDicom), colormap bone, title('Original Image');
                                        %subplot(1,2,2),imagesc(dicomRotate2),colormap bone, title('Processed Image_MN1')
                                        
                                    else
                                        saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Normals\PA\Monochrome1\OutCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PhotoMetricAndTheta\Normals\Monochrome1\OutCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\ThetaAlign\Normals\ThetaOutOfRange\ANON_N_');
                                        %save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','maskDicom');
                                        save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2');
                                    end
                                elseif strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME2')
                                    if (thetaPeak >= -10)&& (thetaPeak <= 10)
                                        saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Normals\PA\Monochrome2\InCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PhotoMetricAndTheta\Normals\Monochrome2\InCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\ThetaAlign\Normals\ThetaInRange\ANON_N_');
                                        %save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','maskDicom');
                                        save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2');
                                        %close all;
                                        figure,
                                        subplot(1,2,1),imagesc(readDicom), colormap bone, title('Original Image');
                                        subplot(1,2,2),imagesc(dicomRotate2),colormap bone, title('Processed Image_MN2')
                                    else
                                        saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Normals\PA\Monochrome2\OutCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PhotoMetricAndTheta\Normals\Monochrome2\OutCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\ThetaAlign\Normals\ThetaOutOfRange\ANON_N_');
                                        %save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','maskDicom');
                                        save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2');
                                    end
                                end
                            elseif strcmp(infoDicom.SeriesDescription,'LAT')||strcmp(infoDicom.SeriesDescription,'Lateral')||strcmp(infoDicom.SeriesDescription,'WRIST LAT')||strcmp(infoDicom.ViewPosition,'LAT')||strcmp(infoDicom.ViewPosition,'Lateral')||strcmp(infoDicom.ViewPosition,'WRIST LAT')||strcmp(infoDicom.ViewPosition,'Lateral Wireless')||strcmp(infoDicom.SeriesDescription,'Lateral Wireless')||strcmp(infoDicom.ViewPosition,'Wrist AP/LAT')||strcmp(infoDicom.SeriesDescription,'Wrist AP/LAT')||strcmp(infoDicom.ViewPosition,'LAT Wrist')||strcmp(infoDicom.SeriesDescription,'LAT Wrist')
                                %elseif strcmp(infoDicom.SeriesDescription,'LAT')||strcmp(infoDicom.SeriesDescription,'Lateral')||strcmp(infoDicom.SeriesDescription,'WRIST LAT')
                                %elseif strcmp(infoDicom.ViewPosition,'LAT')||strcmp(infoDicom.ViewPosition,'Lateral')||strcmp(infoDicom.ViewPosition,'WRIST LAT')
                                if strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME1') %monochrome 1, and thetaPeak between -10 to 10
                                    if (thetaPeak >= -10)&& (thetaPeak <= 10)
                                        saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Normals\LA\Monochrome1\InCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PhotoMetricAndTheta\Normals\Monochrome1\InCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\ThetaAlign\Normals\ThetaInRange\ANON_N_');
                                        %save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','maskDicom');
                                        save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2');
                                        %close all;
                                        
                                        %figure,
                                        %subplot(1,2,1),imagesc(readDicom), colormap bone, title('Original Image');
                                        %subplot(1,2,2),imagesc(dicomRotate2),colormap bone, title('Processed Image_MN1')
                                        
                                    else
                                        saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Normals\LA\Monochrome1\OutCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PhotoMetricAndTheta\Normals\Monochrome1\OutCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\ThetaAlign\Normals\ThetaOutOfRange\ANON_N_');
                                        %save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','maskDicom');
                                        save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2');
                                    end
                                elseif strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME2')
                                    if (thetaPeak >= -10)&& (thetaPeak <= 10)
                                        saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Normals\LA\Monochrome2\InCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PhotoMetricAndTheta\Normals\Monochrome2\InCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\ThetaAlign\Normals\ThetaInRange\ANON_N_');
                                        %save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','maskDicom');
                                        save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2');
                                        %close all;
                                        figure,
                                        subplot(1,2,1),imagesc(readDicom), colormap bone, title('Original Image');
                                        subplot(1,2,2),imagesc(dicomRotate2),colormap bone, title('Processed Image_MN2')
                                    else
                                        saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Normals\LA\Monochrome2\OutCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PhotoMetricAndTheta\Normals\Monochrome2\OutCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\ThetaAlign\Normals\ThetaOutOfRange\ANON_N_');
                                        %save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','maskDicom');
                                        save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2');
                                    end
                                end 
                            end
                        end
                        
                    elseif ChooseDir == 1 % still in process of code updating to accomodate infoDicom.ViewPosition attribute
                        if strcmp(infoDicom.BodyPartExamined,'HAND')|| strcmp(infoDicom.BodyPartExamined,'WRIST')|| strcmp(infoDicom.BodyPartExamined,'ARM')||strcmp(infoDicom.BodyPartExamined,'FOREARM')
                            if strcmp(infoDicom.SeriesDescription,'PA')||strcmp(infoDicom.SeriesDescription,'AP')||strcmp(infoDicom.SeriesDescription,'WRIST PA')||strcmp(infoDicom.ViewPosition,'PA')||strcmp(infoDicom.ViewPosition,'AP')||strcmp(infoDicom.ViewPosition,'WRIST PA')||strcmp(infoDicom.ViewPosition,'AP Wireless')||strcmp(infoDicom.SeriesDescription,'AP Wireless')||strcmp(infoDicom.ViewPosition,'DP Wireless')||strcmp(infoDicom.SeriesDescription,'DP Wireless')
                                if strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME1') %monochrome 1, and thetaPeak between -10 to 10
                                    if (thetaPeak >= -10)&& (thetaPeak <= 10)
                                        saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Patients\PA\Monochrome1\InCategory\ANON_P_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PhotoMetricAndTheta\Patients\Monochrome1\InCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\ThetaAlign\Patients\ThetaInRange\ANON_P_');
                                        %save([saveDir infoDicom.PatientID ],'readDicom','infoDicom','maskDicom');
                                        save([saveDir infoDicom.PatientID ],'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2');
                                        %close all;
                                        
                                        %figure,
                                        %subplot(1,2,1),imagesc(readDicom), colormap bone, title('Original Image');
                                        %subplot(1,2,2),imagesc(dicomRotate2),colormap bone, title('Processed Image_MN1')
                                    else
                                        saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Patients\PA\Monochrome1\OutCategory\ANON_P_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PhotoMetricAndTheta\Patients\Monochrome1\OutCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\ThetaAlign\Patients\ThetaOutOfRange\ANON_P_');
                                        %save([saveDir infoDicom.PatientID ],'readDicom','infoDicom','maskDicom');
                                        save([saveDir infoDicom.PatientID ],'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2');
                                    end
                                elseif strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME2')
                                    if (thetaPeak >= -10)&& (thetaPeak <= 10)
                                        saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Patients\PA\Monochrome2\InCategory\ANON_P_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PhotoMetricAndTheta\Patients\Monochrome2\InCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\ThetaAlign\Normals\ThetaInRange\ANON_N_');
                                        %save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','maskDicom');
                                        save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2');
                                        %close all;
                                        
                                        %figure,
                                        %subplot(1,2,1),imagesc(readDicom), colormap bone, title('Original Image');
                                        %subplot(1,2,2),imagesc(dicomRotate2),colormap bone, title('Processed Image_MN2')
                                    else
                                        saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Patients\PA\Monochrome2\OutCategory\ANON_P_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PhotoMetricAndTheta\Patients\Monochrome2\OutCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\ThetaAlign\Normals\ThetaOutOfRange\ANON_N_');
                                        %save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','maskDicom');
                                        save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2');
                                    end
                                end
                            elseif strcmp(infoDicom.SeriesDescription,'LAT')||strcmp(infoDicom.SeriesDescription,'Lateral')||strcmp(infoDicom.SeriesDescription,'WRIST LAT')||strcmp(infoDicom.ViewPosition,'LAT')||strcmp(infoDicom.ViewPosition,'Lateral')||strcmp(infoDicom.ViewPosition,'WRIST LAT')||strcmp(infoDicom.ViewPosition,'Lateral Wireless')||strcmp(infoDicom.SeriesDescription,'Lateral Wireless')||strcmp(infoDicom.ViewPosition,'Wrist AP/LAT')||strcmp(infoDicom.SeriesDescription,'Wrist AP/LAT')||strcmp(infoDicom.ViewPosition,'LAT Wrist')||strcmp(infoDicom.SeriesDescription,'LAT Wrist')
                                if strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME1') %monochrome 1, and thetaPeak between -10 to 10
                                    if (thetaPeak >= -10)&& (thetaPeak <= 10)
                                        saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Patients\LA\Monochrome1\InCategory\ANON_P_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PhotoMetricAndTheta\Patients\Monochrome1\InCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\ThetaAlign\Patients\ThetaInRange\ANON_P_');
                                        %save([saveDir infoDicom.PatientID ],'readDicom','infoDicom','maskDicom');
                                        save([saveDir infoDicom.PatientID ],'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2');
                                        %close all;
                                        
                                        %figure,
                                        %subplot(1,2,1),imagesc(readDicom), colormap bone, title('Original Image');
                                        %subplot(1,2,2),imagesc(dicomRotate2),colormap bone, title('Processed Image_MN1')
                                    else
                                        saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Patients\LA\Monochrome1\OutCategory\ANON_P_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PhotoMetricAndTheta\Patients\Monochrome1\OutCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\ThetaAlign\Patients\ThetaOutOfRange\ANON_P_');
                                        %save([saveDir infoDicom.PatientID ],'readDicom','infoDicom','maskDicom');
                                        save([saveDir infoDicom.PatientID ],'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2');
                                    end
                                elseif strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME2')
                                    if (thetaPeak >= -10)&& (thetaPeak <= 10)
                                        saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Patients\LA\Monochrome2\InCategory\ANON_P_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PhotoMetricAndTheta\Patients\Monochrome2\InCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\ThetaAlign\Normals\ThetaInRange\ANON_N_');
                                        %save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','maskDicom');
                                        save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2');
                                        %close all;
                                        
                                        %figure,
                                        %subplot(1,2,1),imagesc(readDicom), colormap bone, title('Original Image');
                                        %subplot(1,2,2),imagesc(dicomRotate2),colormap bone, title('Processed Image_MN2')
                                    else
                                        saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Patients\LA\Monochrome2\OutCategory\ANON_P_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PhotoMetricAndTheta\Patients\Monochrome2\OutCategory\ANON_N_');
                                        %saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\ThetaAlign\Normals\ThetaOutOfRange\ANON_N_');
                                        %save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','maskDicom');
                                        save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2');
                                    end
                                end
                            end
                        end
                    end
                    
                end
                
            end
        end
    end
end

                    
                
            
            
            
                                    
%                     figure, 
%                     subplot(1,5,1), imagesc(readDicom), colormap bone, title('Original Image');
%                     subplot(1,5,2), imagesc(dicomRotate1), colormap bone, title('Aligned Image Style 1');
%                     subplot(1,5,3), imagesc(dicomRotRemoveEdge),colormap bone, title('edge removed style 1'); 
%                     subplot (1,5,4),imagesc(dicomRotate2), colormap bone, title('Aligned Image Style 2');
%                     subplot(1,5,5),imagesc(dicomRotRemoveEdge2),colormap bone, title('edge removed style 2');
                    
                    %subplot(1,5,5),imagesc(Cr),colormap bone, title('Cropped Image');
                    %subplot (1,5,5),imagesc(dicomRotRemoveEdge2),colormap bone, title('edge removed style 2');
                    
                  %  edgeBWThresh=~imbinarize(Cr);
                  % figure,imagesc(dicomRotRemoveEdge2),colormap bone, title('edge removed style 2');
                     
%                      figure,
%                      subplot(1,2,1),histogram(dicomRotRemoveEdge2), title('histogram dicomRotRemoveEdge2');
%                      subplot(1,2,2),plot(c),title('pixel-value cross-sections');
                     
%                      figure,
%                      subplot(1,2,1),imagesc(readDicom), colormap bone, title('Original Image');
%                      subplot(1,2,2),imagesc(dicomRotate2),colormap bone, title('Processed Image')
                     
               % end
            %end
       % end
    %end
%end







