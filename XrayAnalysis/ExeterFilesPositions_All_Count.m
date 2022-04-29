
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
                        if strcmp(infoDicom.SeriesDescription,'LAT')||strcmp(infoDicom.SeriesDescription,'Lateral')||strcmp(infoDicom.SeriesDescription,'WRIST LAT')||strcmp(infoDicom.ViewPosition,'LAT')||strcmp(infoDicom.ViewPosition,'Lateral')||strcmp(infoDicom.ViewPosition,'WRIST LAT')||strcmp(infoDicom.ViewPosition,'Lateral Wireless')||strcmp(infoDicom.SeriesDescription,'Lateral Wireless')||strcmp(infoDicom.ViewPosition,'Wrist AP/LAT')||strcmp(infoDicom.SeriesDescription,'Wrist AP/LAT')||strcmp(infoDicom.ViewPosition,'LAT Wrist')||strcmp(infoDicom.SeriesDescription,'LAT Wrist')
                            saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\Positions\Normals\LA\LA_');
                            save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom');
                            
                        elseif strcmp(infoDicom.SeriesDescription,'PA')||strcmp(infoDicom.SeriesDescription,'AP')||strcmp(infoDicom.SeriesDescription,'WRIST PA')||strcmp(infoDicom.ViewPosition,'PA')||strcmp(infoDicom.ViewPosition,'AP')||strcmp(infoDicom.ViewPosition,'WRIST PA')||strcmp(infoDicom.ViewPosition,'AP Wireless')||strcmp(infoDicom.SeriesDescription,'AP Wireless')||strcmp(infoDicom.ViewPosition,'DP Wireless')||strcmp(infoDicom.SeriesDescription,'DP Wireless')
                                                     
                            saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\Positions\Normals\PA\PA_');
                            save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom');
                        end
                    elseif ChooseDir == 1
                        if strcmp(infoDicom.SeriesDescription,'LAT')||strcmp(infoDicom.SeriesDescription,'Lateral')||strcmp(infoDicom.SeriesDescription,'WRIST LAT')||strcmp(infoDicom.ViewPosition,'LAT')||strcmp(infoDicom.ViewPosition,'Lateral')||strcmp(infoDicom.ViewPosition,'WRIST LAT')||strcmp(infoDicom.ViewPosition,'Lateral Wireless')||strcmp(infoDicom.SeriesDescription,'Lateral Wireless')||strcmp(infoDicom.ViewPosition,'Wrist AP/LAT')||strcmp(infoDicom.SeriesDescription,'Wrist AP/LAT')||strcmp(infoDicom.ViewPosition,'LAT Wrist')||strcmp(infoDicom.SeriesDescription,'LAT Wrist')
                            saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\Positions\Patients\LA\LA_');
                            save( [saveDir infoDicom.PatientID] ,'readDicom','infoDicom');
                            
                        elseif strcmp(infoDicom.SeriesDescription,'PA')||strcmp(infoDicom.SeriesDescription,'AP')||strcmp(infoDicom.SeriesDescription,'WRIST PA')||strcmp(infoDicom.ViewPosition,'PA')||strcmp(infoDicom.ViewPosition,'AP')||strcmp(infoDicom.ViewPosition,'WRIST PA')||strcmp(infoDicom.ViewPosition,'AP Wireless')||strcmp(infoDicom.SeriesDescription,'AP Wireless')||strcmp(infoDicom.ViewPosition,'DP Wireless')||strcmp(infoDicom.SeriesDescription,'DP Wireless')
                            saveDir= strcat(baseDir,filesep,'DICOM_Karen_ANDUpdate\Positions\Patients\PA\PA_');
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
DirLANormals=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\DICOM_Karen_ANDUpdate\Positions\Normals\LA\*.mat');
elmDirLANormals=numel(DirLANormals)

DirPANormals=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\DICOM_Karen_ANDUpdate\Positions\Normals\PA\*.mat');
elmDirPANormals=numel(DirPANormals)

DirLAPatients=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\DICOM_Karen_ANDUpdate\Positions\Patients\LA\*.mat');
elmDirLAPatients=numel(DirLAPatients)

DirPAPatients=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\DICOM_Karen_ANDUpdate\Positions\Patients\PA\*.mat');
elmDirPAPatients=numel(DirPAPatients)

                                    
