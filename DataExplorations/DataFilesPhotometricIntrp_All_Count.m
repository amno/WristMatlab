
% clc
 clear all;
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
                        if strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME1')
                            saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\Photometric\Normals\MN1\MN1_');
                            save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom');
                            
                        elseif strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME2')
                                         
                            saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\Photometric\Normals\MN2\MN2_');
                            save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom');
                        end
                    elseif ChooseDir == 1
                        if strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME1')
                            saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\Photometric\Patients\MN1\MN1_');
                            save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom');
                            
                        elseif strcmp(infoDicom.PhotometricInterpretation,'MONOCHROME2')
                            saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\Photometric\Patients\MN2\MN2_');
                            save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom');
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
DirMn1Normals=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\DICOM_Karen_ANDUpdate\Photometric\Normals\MN1\*.mat');
elmDirMn1Normals=numel(DirMn1Normals)

DirMn2Normals=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\DICOM_Karen_ANDUpdate\Photometric\Normals\MN2\*.mat');
elmDirMn2Normals=numel(DirMn2Normals)

DirMn1Patients=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\DICOM_Karen_ANDUpdate\Photometric\Patients\MN1\*.mat');
elmDirMn1Patients=numel(DirMn1Patients)

DirMn2Patients=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\DICOM_Karen_ANDUpdate\Photometric\Patients\MN2\*.mat');
elmDirMn2Patients=numel(DirMn2Patients)

                                    
