
% clc
 %clear all;
 %close all;

%%
baseDir = 'C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB';
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
                    
                    
                    %save ReadDicom, infoDicom and other features into .mat file
                    if ChooseDir == 0
                        if strcmp(infoDicom.BodyPartExamined,'HAND')|| strcmp(infoDicom.BodyPartExamined,'WRIST')|| strcmp(infoDicom.BodyPartExamined,'ARM')||strcmp(infoDicom.BodyPartExamined,'FOREARM')
                            if strcmp(infoDicom.SeriesDescription,'PA')||strcmp(infoDicom.SeriesDescription,'AP')||strcmp(infoDicom.SeriesDescription,'WRIST PA')||strcmp(infoDicom.ViewPosition,'PA')||strcmp(infoDicom.ViewPosition,'AP')||strcmp(infoDicom.ViewPosition,'WRIST PA')||strcmp(infoDicom.ViewPosition,'AP Wireless')||strcmp(infoDicom.SeriesDescription,'AP Wireless')||strcmp(infoDicom.ViewPosition,'DP Wireless')||strcmp(infoDicom.SeriesDescription,'DP Wireless')
                                %if strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME1')
                                if strcmp(infoDicom.PatientSex,'F') %monochrome 1, and thetaPeak between -10 to 10
                                    %if (thetaPeak >= -10)&& (thetaPeak <= 10)
                                    %                                         saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Normals\PA\Monochrome1\InCategory\ANON_N_');
                                    %                                         save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2','cropDicomImage');
                                    saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\Gender\InResearchCategories\Normals\Females\F_');
                                    save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom');
                                    
                                    %else
                                    %                                         saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Normals\PA\Monochrome1\OutCategory\ANON_N_');
                                    %                                         save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2','cropDicomImage');
                                    %end
                                    %elseif strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME2')
                                elseif strcmp(infoDicom.PatientSex,'M')
                                    
                                    saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\Gender\InResearchCategories\Normals\Males\M_');
                                    save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom');
                                    %if (thetaPeak >= -10)&& (thetaPeak <= 10)
                                    %                                         saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Normals\PA\Monochrome2\InCategory\ANON_N_');
                                    %                                         save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2','cropDicomImage');
                                    %
                                    % else
                                    %                                         saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Normals\PA\Monochrome2\OutCategory\ANON_N_');
                                    %                                         save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2','cropDicomImage');
                                    %end
                                end
                            elseif strcmp(infoDicom.SeriesDescription,'LAT')||strcmp(infoDicom.SeriesDescription,'Lateral')||strcmp(infoDicom.SeriesDescription,'WRIST LAT')||strcmp(infoDicom.ViewPosition,'LAT')||strcmp(infoDicom.ViewPosition,'Lateral')||strcmp(infoDicom.ViewPosition,'WRIST LAT')||strcmp(infoDicom.ViewPosition,'Lateral Wireless')||strcmp(infoDicom.SeriesDescription,'Lateral Wireless')||strcmp(infoDicom.ViewPosition,'Wrist AP/LAT')||strcmp(infoDicom.SeriesDescription,'Wrist AP/LAT')||strcmp(infoDicom.ViewPosition,'LAT Wrist')||strcmp(infoDicom.SeriesDescription,'LAT Wrist')
                                %if strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME1') %monochrome 1, and thetaPeak between -10 to 10
                                if strcmp(infoDicom.PatientSex,'F')
                                     saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\Gender\InResearchCategories\Normals\Females\F_');
                                     save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom');
                                    %if (thetaPeak >= -10)&& (thetaPeak <= 10)
                                    %                                         saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Normals\LA\Monochrome1\InCategory\ANON_N_');
                                    %                                         save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2','cropDicomImage');
                                    
                                    %else
                                    %                                         saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Normals\LA\Monochrome1\OutCategory\ANON_N_');
                                    %                                         save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2','cropDicomImage');
                                    %end
                                    %elseif strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME2')
                                elseif strcmp(infoDicom.PatientSex,'M')
                                    saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\Gender\InResearchCategories\Normals\Males\M_');
                                     save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom');
                                    %if (thetaPeak >= -10)&& (thetaPeak <= 10)
                                    %                                         saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Normals\LA\Monochrome2\InCategory\ANON_N_');
                                    %                                         save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2','cropDicomImage');
                                    
                                    %else
                                    %                                         saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Normals\LA\Monochrome2\OutCategory\ANON_N_');
                                    %                                         save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2','cropDicomImage');
                                    %end
                                end
                                
                            else
                                %                             saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Normals\Others\ANON_N_');
                                %                             save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2','cropDicomImage');
                            end
                        else
                            %                             saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Normals\Others\ANON_N_');
                            %                             save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2','cropDicomImage');
                        end
                        
                    elseif ChooseDir == 1
                        if strcmp(infoDicom.BodyPartExamined,'HAND')|| strcmp(infoDicom.BodyPartExamined,'WRIST')|| strcmp(infoDicom.BodyPartExamined,'ARM')||strcmp(infoDicom.BodyPartExamined,'FOREARM')
                            if strcmp(infoDicom.SeriesDescription,'PA')||strcmp(infoDicom.SeriesDescription,'AP')||strcmp(infoDicom.SeriesDescription,'WRIST PA')||strcmp(infoDicom.ViewPosition,'PA')||strcmp(infoDicom.ViewPosition,'AP')||strcmp(infoDicom.ViewPosition,'WRIST PA')||strcmp(infoDicom.ViewPosition,'AP Wireless')||strcmp(infoDicom.SeriesDescription,'AP Wireless')||strcmp(infoDicom.ViewPosition,'DP Wireless')||strcmp(infoDicom.SeriesDescription,'DP Wireless')
                                %if strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME1')
                                if strcmp(infoDicom.PatientSex,'F')%monochrome 1, and thetaPeak between -10 to 10
                                    saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\Gender\InResearchCategories\Patients\Females\F_');
                                    save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom');
                                    
                                    
                                    %                                     if (thetaPeak >= -10)&& (thetaPeak <= 10)
                                    %                                         %                                         saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Patients\PA\Monochrome1\InCategory\ANON_P_');
                                    %                                         %                                         save([saveDir infoDicom.PatientID ],'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2','cropDicomImage');
                                    %                                         %                                                                             else
                                    %                                         %                                         saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Patients\PA\Monochrome1\OutCategory\ANON_P_');
                                    %                                         %                                         save([saveDir infoDicom.PatientID ],'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2','cropDicomImage');
                                    %                                     end
                                    %elseif strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME2')
                                elseif strcmp(infoDicom.PatientSex,'M')
                                    saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\Gender\InResearchCategories\Patients\Males\M_');
                                    save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom');
                                    %                                     if (thetaPeak >= -10)&& (thetaPeak <= 10)
                                    %                                         saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Patients\PA\Monochrome2\InCategory\ANON_P_');
                                    %                                         save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2','cropDicomImage');
                                    %
                                    %                                     else
                                    %                                         %                                         saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Patients\PA\Monochrome2\OutCategory\ANON_P_');
                                    %                                         %                                         save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2','cropDicomImage');
                                    %                                     end
                                end
                            elseif strcmp(infoDicom.SeriesDescription,'LAT')||strcmp(infoDicom.SeriesDescription,'Lateral')||strcmp(infoDicom.SeriesDescription,'WRIST LAT')||strcmp(infoDicom.ViewPosition,'LAT')||strcmp(infoDicom.ViewPosition,'Lateral')||strcmp(infoDicom.ViewPosition,'WRIST LAT')||strcmp(infoDicom.ViewPosition,'Lateral Wireless')||strcmp(infoDicom.SeriesDescription,'Lateral Wireless')||strcmp(infoDicom.ViewPosition,'Wrist AP/LAT')||strcmp(infoDicom.SeriesDescription,'Wrist AP/LAT')||strcmp(infoDicom.ViewPosition,'LAT Wrist')||strcmp(infoDicom.SeriesDescription,'LAT Wrist')
                                %if strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME1') %monochrome 1, and thetaPeak between -10 to 10
                                if strcmp(infoDicom.PatientSex,'F')
                                    saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\Gender\InResearchCategories\Patients\Females\F_');
                                    save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom');
                                    %                                     if (thetaPeak >= -10)&& (thetaPeak <= 10)
                                    %                                         %                                         saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Patients\LA\Monochrome1\InCategory\ANON_P_');
                                    %                                         %                                         save([saveDir infoDicom.PatientID ],'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2','cropDicomImage');
                                    %
                                    %
                                    %                                     else
                                    %                                         %                                         saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Patients\LA\Monochrome1\OutCategory\ANON_P_');
                                    %                                         %                                         save([saveDir infoDicom.PatientID ],'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2','cropDicomImage');
                                    %                                     end
                                    %elseif strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME2')
                                elseif strcmp(infoDicom.PatientSex,'M')
                                    saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\Gender\InResearchCategories\Patients\Males\M_');
                                    save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom');
                                    %                                     if (thetaPeak >= -10)&& (thetaPeak <= 10)
                                    %                                         %                                         saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Patients\LA\Monochrome2\InCategory\ANON_P_');
                                    %                                         %                                         save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2','cropDicomImage');
                                    %                                         %
                                    %                                     else
                                    %                                         %                                         saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Patients\LA\Monochrome2\OutCategory\ANON_P_');
                                    %                                         %                                         save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2','cropDicomImage');
                                    %                                     end
                                end
                                
                            else
                                %                                 saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Patients\Others\ANON_P_');
                                %                                 save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2','cropDicomImage');
                            end
                        else
                            %                             saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\PositionPhotoMetricTheta\Patients\Others\ANON_P_');
                            %                                 save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom','BW_P','thetaPeak','dicomRotate2','cropDicomImage');
                        end
                        
                        
                    end
                    
                end
                
            end
        end
    end
end


                    
                
% dat1Info=dicominfo('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\Data\Patients\T01_Tranche1\PAT1\STD1\SER1\IMG1');
% dat1=dicomread('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\Data\Patients\T01_Tranche1\PAT1\STD1\SER1\IMG1');
% dat1Info.PatientSex
            
 %%%%count images
DirFNormals=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\DICOM_Karen_ANDUpdate\Gender\InResearchCategories\Normals\F*\*.mat');
elmDirFNormals=numel(DirFNormals)

DirMNormals=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\DICOM_Karen_ANDUpdate\Gender\InResearchCategories\Normals\M*\*.mat');
elmDirMNormals=numel(DirMNormals)

DirFPatients=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\DICOM_Karen_ANDUpdate\Gender\InResearchCategories\Patients\F*\*.mat');
elmDirFPatients=numel(DirFPatients)

DirMPatients=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\DICOM_Karen_ANDUpdate\Gender\InResearchCategories\Patients\M*\*.mat');
elmDirMPatients=numel(DirMPatients)

                                    
