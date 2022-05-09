
clc
clear all;
close all;

%%
baseDir = 'C:\Users\aczf102\Documents\MATLAB\Data';
% baseDir     = 'D:\OneDrive - City, University of London\Acad\Research\Exeter_Fracture\DICOM';
ChooseDir = input('Please choose folder to proceed, 0 for Normal, 1 for Patient, 2 for all');

if ChooseDir == 0
    PatientsDir = strcat(baseDir,filesep,'Normals',filesep);
    dir0    = dir(strcat(PatientsDir,'N*'));
elseif ChooseDir==1
    PatientsDir = strcat(baseDir,filesep,'Patients',filesep);
    % read the first folder, use "T" as the first name is always TRANCHE
    dir0    = dir(strcat(PatientsDir,'T*'));
elseif ChooseDir==2
    PatientsDir= strcat(baseDir,filesep);
    dir0 = dir(PatientsDir);
else
   disp('Sorry, incorrect input !')   
end


% It is good practice to use longer names than just i,t,j,etc.
numFolders_0 = size(dir0,1);

%%

for counter_0=1:numFolders_0
    if (ChooseDir==0) || (ChooseDir==1)
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
                         maskDicom=zeros(size(readDicom));
                        if ChooseDir == 0
                            save(['C:\Users\aczf102\Documents\MATLAB\DICOM_Karen_ANDUpdate\Exp\Normals\ANON_N_' infoDicom.PatientID ],'readDicom','infoDicom','maskDicom');
                        else
                            save(['C:\Users\aczf102\Documents\MATLAB\DICOM_Karen_ANDUpdate\Exp\Patients\ANON_P_' infoDicom.PatientID ],'readDicom','infoDicom','maskDicom');
                        end
                        
                    end
                end
            end
        end
    elseif ChooseDir==2
        disp(strcat('----',dir0(counter_0).name,'----'))
        dir1                    = dir(strcat(dir0(counter_0).name,filesep,'Normals')); % folder N* 
        dir11                   = dir(strcat(dir0(counter_0).name,filesep,'Patients'));%Folder P*
        numFolders_1            = size(dir1,1);
        numFolders_11            = size(dir11,1);
        for counter_1=1:numFolders_1
            disp(strcat(PatientsDir,dir0(counter_0).name,filesep,dir1(counter_1).name));
            dir2 = dir(strcat(PatientsDir,dir0(counter_0).name,filesep,dir1(counter_1).name,filesep,'N*')); %folder N* or T*
            numFolders_2=size(dir2,1);
            for counter_2=1:numFolders_2
                disp(strcat(PatientsDir,dir0(counter_0).name,filesep,dir1(counter_1).name,filesep,dir2(counter_2).name));
                dir3=dir(strcat(PatientsDir,dir0(counter_0).name,filesep,dir1(counter_1).name,filesep,dir2(counter_2).name,filesep,'P*'));
                numFolders_3=size(dir3,1);
                for counter_3=1:numFolders_3
                    disp(strcat(PatientsDir,dir0(counter_0).name,filesep,dir1(counter_1).name,filesep,dir2(counter_2).name,filesep,dir3(counter_3).name));
                    dir4= dir(strcat(PatientsDir,dir0(counter_0).name,filesep,dir1(counter_1).name,filesep,dir2(counter_2).name,filesep,dir3(counter_3).name,filesep,'ST*'));
                    numFolders_4=size(dir4,1);
                    for counter_4=1:numFolders_4
                        disp(strcat(PatientsDir,dir0(counter_0).name,filesep,dir1(counter_1).name,filesep,dir2(counter_2).name,filesep,dir3(counter_3).name,dir4(counter_4).name));
                        dir5= dir(strcat(PatientsDir,dir0(counter_0).name,filesep,dir1(counter_1).name,filesep,dir2(counter_2).name,filesep,dir3(counter_3).name,filesep,dir4(counter_4),filesep,'SER*'));
                        numFolders_5=size(dir5,1);
                        for counter_5=1:numFolders_5
                            disp(strcat(PatientsDir,dir0(counter_0).name,filesep,dir1(counter_1).name,filesep,dir2(counter_2).name,filesep,dir3(counter_3).name,dir4(counter_4).name,dir5(counter_5).name));
                            dir6=dir(strcat(PatientsDir,dir0(counter_0).name,filesep,dir1(counter_1).name,filesep,dir2(counter_2).name,filesep,dir3(counter_3).name,filesep,dir4(counter_4),filesep,dir5(counter_5).name,filesep,'IMG*'));
                            numFolders_6=size(dir6,1);
                            for counter_6=1:numFolders_6
                                disp(strcat(PatientsDir,dir0(counter_0).name,filesep,dir1(counter_1).name,filesep,dir2(counter_2).name,filesep,dir3(counter_3).name,dir4(counter_4).name,dir5(counter_5).name,dir6(counter_6).name))
                            end
                        end
                    end
                end
            end
        end
        
        for counter_1=1:numFolders_11
            disp(strcat(PatientsDir,dir0(counter_0).name,filesep,dir11(counter_1).name));
            dir2 = dir(strcat(PatientsDir,dir0(counter_0).name,filesep,dir11(counter_1).name,filesep,'N*')); %folder N* or T*
            numFolders_21=size(dir2,1);
            for counter_2=1:numFolders_21
                disp(strcat(PatientsDir,dir0(counter_0).name,filesep,dir11(counter_1).name,filesep,dir2(counter_2).name));
                dir3=dir(strcat(PatientsDir,dir0(counter_0).name,filesep,dir11(counter_1).name,filesep,dir2(counter_2).name,filesep,'P*'));
                numFolders_31=size(dir3,1);
                for counter_3=1:numFolders_31
                    disp(strcat(PatientsDir,dir0(counter_0).name,filesep,dir11(counter_1).name,filesep,dir2(counter_2).name,filesep,dir3(counter_3).name));
                    dir4= dir(strcat(PatientsDir,dir0(counter_0).name,filesep,dir1(counter_1).name,filesep,dir2(counter_2).name,filesep,dir3(counter_3).name,filesep,'ST*'));
                    numFolders_41=size(dir4,1);
                    for counter_4=1:numFolders_41
                        disp(strcat(PatientsDir,dir0(counter_0).name,filesep,dir11(counter_1).name,filesep,dir2(counter_2).name,filesep,dir3(counter_3).name,dir4(counter_4).name));
                        dir5= dir(strcat(PatientsDir,dir0(counter_0).name,filesep,dir11(counter_1).name,filesep,dir2(counter_2).name,filesep,dir3(counter_3).name,filesep,dir4(counter_4),filesep,'SER*'));
                        numFolders_51=size(dir5,1);
                        for counter_5=1:numFolders_51
                            disp(strcat(PatientsDir,dir0(counter_0).name,filesep,dir11(counter_1).name,filesep,dir2(counter_2).name,filesep,dir3(counter_3).name,dir4(counter_4).name,dir5(counter_5).name));
                            dir6=dir(strcat(PatientsDir,dir0(counter_0).name,filesep,dir11(counter_1).name,filesep,dir2(counter_2).name,filesep,dir3(counter_3).name,filesep,dir4(counter_4),filesep,dir5(counter_5).name,filesep,'IMG*'));
                            numFolders_61=size(dir6,1);
                            for counter_6=1:numFolders_61
                                disp(strcat(PatientsDir,dir0(counter_0).name,filesep,dir11(counter_1).name,filesep,dir2(counter_2).name,filesep,dir3(counter_3).name,dir4(counter_4).name,dir5(counter_5).name,dir6(counter_6).name))
                            end
                        end
                    end
                end
            end
        end
            
    else
        disp('Sorry, incorrect input !')
    end
end
 


%         
%             % convert into .mat file
%             %save(['C:\Users\aczf102\Documents\MATLAB\DICOM_Karen_ANDUpdate\Tes4_' infoDicom.PatientID '_' infoDicom.SeriesDescription],'readDicom','infoDicom','maskDicom');
