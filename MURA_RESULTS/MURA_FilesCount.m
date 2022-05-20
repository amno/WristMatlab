%clear all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Wrist Train images folder
DirMuraTrainWrist= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_WRIST\*\*\*.png');
TotalDataMURAXWristTrainFolder= numel(DirMuraTrainWrist)

DirMuraWristTrainStudy1Positive=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_WRIST\p*\study1_positive\*.png');
DirMuraWristTrainStudy2Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_WRIST\p*\study2_positive\*.png');
DirMuraWristTrainStudy3Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_WRIST\p*\study3_positive\*.png');
DirMuraWristTrainStudy4Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_WRIST\p*\study4_positive\*.png');
TrainStudy1Positive=numel(DirMuraWristTrainStudy1Positive)
TrainStudy2Positive=numel(DirMuraWristTrainStudy2Positive)
TrainStudy3Positive=numel(DirMuraWristTrainStudy3Positive)
TrainStudy4Positive=numel(DirMuraWristTrainStudy4Positive)

DirMuraWristTrainStudy1Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_WRIST\p*\study1_negative\*.png');
DirMuraWristTrainStudy2Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_WRIST\p*\study2_negative\*.png');
DirMuraWristTrainStudy3Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_WRIST\p*\study3_negative\*.png');
DirMuraWristTrainStudy4Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_WRIST\p*\study4_negative\*.png');


TrainStudy1Negative=numel(DirMuraWristTrainStudy1Negative)
TrainStudy2Negative=numel(DirMuraWristTrainStudy2Negative)
TrainStudy3Negative=numel(DirMuraWristTrainStudy3Negative)
TrainStudy4Negative=numel(DirMuraWristTrainStudy4Negative)

totalWristDataTrainStudyPositiveNegative= TrainStudy1Positive+TrainStudy2Positive+TrainStudy3Positive+TrainStudy4Positive+TrainStudy1Negative+TrainStudy2Negative+TrainStudy3Negative+TrainStudy4Negative

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Wrist Valid images folder

DirMuraValidWrist= dir('*\XR_WRIST\*\*\*.png');
TotalDataMURAXWristValidFolder= numel(DirMuraValidWrist)

DirMuraWristValidStudy1Positive=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_WRIST\p*\study1_positive\*.png');
DirMuraWristValidStudy2Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_WRIST\p*\study2_positive\*.png');
DirMuraWristValidStudy3Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_WRIST\p*\study3_positive\*.png');
DirMuraWristValidStudy4Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_WRIST\p*\study4_positive\*.png');
ValidStudy1Positive=numel(DirMuraWristValidStudy1Positive)
ValidStudy2Positive=numel(DirMuraWristValidStudy2Positive)
ValidStudy3Positive=numel(DirMuraWristValidStudy3Positive)
ValidStudy4Positive=numel(DirMuraWristValidStudy4Positive)

DirMuraWristValidStudy1Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_WRIST\p*\study1_negative\*.png');
DirMuraWristValidStudy2Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_WRIST\p*\study2_negative\*.png');
DirMuraWristValidStudy3Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_WRIST\p*\study3_negative\*.png');
DirMuraWristValidStudy4Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_WRIST\p*\study4_negative\*.png');

ValidStudy1Negative=numel(DirMuraWristValidStudy1Negative)
ValidStudy2Negative=numel(DirMuraWristValidStudy2Negative)
ValidStudy3Negative=numel(DirMuraWristValidStudy3Negative)
ValidStudy4Negative=numel(DirMuraWristValidStudy4Negative)

totalWristDataValidStudyPositiveNegative= ValidStudy1Positive+ValidStudy2Positive+ValidStudy3Positive+ValidStudy4Positive+ValidStudy1Negative+ValidStudy2Negative+ValidStudy3Negative+ValidStudy4Negative

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% count all data inside each folder of body part dataset
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Train Folder%
aTWrist=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_WRIST\p*\s*\*.png');
naTWrist=numel(aTWrist)

aTShoulder=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_SHOULDER\p*\s*\*.png');
naTShoulder=numel(aTShoulder)

aTHumerus=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_HUMERUS\p*\s*\*.png');
naTHumerus=numel(aTHumerus)

aTHand=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_HAND\p*\s*\*.png');
naTHand=numel(aTHand)

aTFore=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_FOREARM\p*\s*\*.png');
naTFore=numel(aTFore)

aTFing=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_FINGER\p*\s*\*.png');
naTFing=numel(aTFing)

aTElb=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_ELBOW\p*\s*\*.png');
naTElb=numel(aTElb)

%Valid Folder%

aWrist=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_WRIST\p*\s*\*.png');
naWrist=numel(aWrist)

aShoulder=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_SHOULDER\p*\s*\*.png');
naShoulder=numel(aShoulder)

aHumerus=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_HUMERUS\p*\s*\*.png');
naHumerus=numel(aHumerus)

aHand=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_HAND\p*\s*\*.png');
naHand=numel(aHand)

aFore=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_FOREARM\p*\s*\*.png');
naFore=numel(aFore)

aFing=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_FINGER\p*\s*\*.png');
naFing=numel(aFing)

aElb=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_ELBOW\p*\s*\*.png');
naElb=numel(aElb)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Elbow Train images folder

DirMuraTrainElbow= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_ELBOW\*\*\*.png');
TotalDataMURAXElbowTrainFolder= numel(DirMuraTrainElbow)

DirMuraElbowTrainStudy1Positive=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_ELBOW\p*\study1_positive\*.png');
DirMuraElbowTrainStudy2Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_ELBOW\p*\study2_positive\*.png');
DirMuraElbowTrainStudy3Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_ELBOW\p*\study3_positive\*.png');
DirMuraElbowTrainStudy4Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_ELBOW\p*\study4_positive\*.png');
TrainStudy1PositiveElbow=numel(DirMuraElbowTrainStudy1Positive)
TrainStudy2PositiveElbow=numel(DirMuraElbowTrainStudy2Positive)
TrainStudy3PositiveElbow=numel(DirMuraElbowTrainStudy3Positive)
TrainStudy4PositiveElbow=numel(DirMuraElbowTrainStudy4Positive)

DirMuraElbowTrainStudy1Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_ELBOW\p*\study1_negative\*.png');
DirMuraElbowTrainStudy2Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_ELBOW\p*\study2_negative\*.png');
DirMuraElbowTrainStudy3Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_ELBOW\p*\study3_negative\*.png');
DirMuraElbowTrainStudy4Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_ELBOW\p*\study4_negative\*.png');


TrainStudy1NegativeElbow=numel(DirMuraElbowTrainStudy1Negative)
TrainStudy2NegativeElbow=numel(DirMuraElbowTrainStudy2Negative)
TrainStudy3NegativeElbow=numel(DirMuraElbowTrainStudy3Negative)
TrainStudy4NegativeElbow=numel(DirMuraElbowTrainStudy4Negative)

totalElbowDataTrainStudyPositiveNegative= TrainStudy1PositiveElbow+TrainStudy2PositiveElbow+TrainStudy3PositiveElbow+TrainStudy4PositiveElbow+TrainStudy1NegativeElbow+TrainStudy2NegativeElbow+TrainStudy3NegativeElbow+TrainStudy4NegativeElbow

%Elbow Valid images folder

DirMuraValidElbow= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_ELBOW\*\*\*.png');
TotalDataMURAXElbowValidFolder= numel(DirMuraValidElbow)

DirMuraElbowValidStudy1Positive=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_ELBOW\p*\study1_positive\*.png');
DirMuraElbowValidStudy2Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_ELBOW\p*\study2_positive\*.png');
DirMuraElbowValidStudy3Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_ELBOW\p*\study3_positive\*.png');
DirMuraElbowValidStudy4Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_ELBOW\p*\study4_positive\*.png');
ValidStudy1PositiveElbow=numel(DirMuraElbowValidStudy1Positive)
ValidStudy2PositiveElbow=numel(DirMuraElbowValidStudy2Positive)
ValidStudy3PositiveElbow=numel(DirMuraElbowValidStudy3Positive)
ValidStudy4PositiveElbow=numel(DirMuraElbowValidStudy4Positive)

DirMuraElbowValidStudy1Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_ELBOW\p*\study1_negative\*.png');
DirMuraElbowValidStudy2Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_ELBOW\p*\study2_negative\*.png');
DirMuraElbowValidStudy3Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_ELBOW\p*\study3_negative\*.png');
DirMuraElbowValidStudy4Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_ELBOW\p*\study4_negative\*.png');


ValidStudy1NegativeElbow=numel(DirMuraElbowValidStudy1Negative)
ValidStudy2NegativeElbow=numel(DirMuraElbowValidStudy2Negative)
ValidStudy3NegativeElbow=numel(DirMuraElbowValidStudy3Negative)
ValidStudy4NegativeElbow=numel(DirMuraElbowValidStudy4Negative)

totalElbowDataValidStudyPositiveNegative= ValidStudy1PositiveElbow+ValidStudy2PositiveElbow+ValidStudy3PositiveElbow+ValidStudy4PositiveElbow+ValidStudy1NegativeElbow+ValidStudy2NegativeElbow+ValidStudy3NegativeElbow+ValidStudy4NegativeElbow

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Finger Train images folder

DirMuraTrainFinger= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_FINGER\*\*\*.png');
TotalDataMURAXFingerTrainFolder= numel(DirMuraTrainFinger)

DirMuraFingerTrainStudy1Positive=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_FINGER\p*\study1_positive\*.png');
DirMuraFingerTrainStudy2Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_FINGER\p*\study2_positive\*.png');
DirMuraFingerTrainStudy3Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_FINGER\p*\study3_positive\*.png');
DirMuraFingerTrainStudy4Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_FINGER\p*\study4_positive\*.png');
TrainStudy1PositiveFinger=numel(DirMuraFingerTrainStudy1Positive)
TrainStudy2PositiveFinger=numel(DirMuraFingerTrainStudy2Positive)
TrainStudy3PositiveFinger=numel(DirMuraFingerTrainStudy3Positive)
TrainStudy4PositiveFinger=numel(DirMuraFingerTrainStudy4Positive)

DirMuraFingerTrainStudy1Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_FINGER\p*\study1_negative\*.png');
DirMuraFingerTrainStudy2Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_FINGER\p*\study2_negative\*.png');
DirMuraFingerTrainStudy3Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_FINGER\p*\study3_negative\*.png');
DirMuraFingerTrainStudy4Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_FINGER\p*\study4_negative\*.png');


TrainStudy1NegativeFinger=numel(DirMuraFingerTrainStudy1Negative)
TrainStudy2NegativeFinger=numel(DirMuraFingerTrainStudy2Negative)
TrainStudy3NegativeFinger=numel(DirMuraFingerTrainStudy3Negative)
TrainStudy4NegativeFinger=numel(DirMuraFingerTrainStudy4Negative)

totalFingerDataTrainStudyPositiveNegative= TrainStudy1PositiveFinger+TrainStudy2PositiveFinger+TrainStudy3PositiveFinger+TrainStudy4PositiveFinger+TrainStudy1NegativeFinger+TrainStudy2NegativeFinger+TrainStudy3NegativeFinger+TrainStudy4NegativeFinger

%Finger Valid images folder
DirMuraValidFinger= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_FINGER\*\*\*.png');
TotalDataMURAXFingerValidFolder= numel(DirMuraValidFinger)

DirMuraFingerValidStudy1Positive=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_FINGER\p*\study1_positive\*.png');
DirMuraFingerValidStudy2Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_FINGER\p*\study2_positive\*.png');
DirMuraFingerValidStudy3Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_FINGER\p*\study3_positive\*.png');
DirMuraFingerValidStudy4Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_FINGER\p*\study4_positive\*.png');
ValidStudy1PositiveFinger=numel(DirMuraFingerValidStudy1Positive)
ValidStudy2PositiveFinger=numel(DirMuraFingerValidStudy2Positive)
ValidStudy3PositiveFinger=numel(DirMuraFingerValidStudy3Positive)
ValidStudy4PositiveFinger=numel(DirMuraFingerValidStudy4Positive)

DirMuraFingerValidStudy1Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_FINGER\p*\study1_negative\*.png');
DirMuraFingerValidStudy2Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_FINGER\p*\study2_negative\*.png');
DirMuraFingerValidStudy3Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_FINGER\p*\study3_negative\*.png');
DirMuraFingerValidStudy4Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_FINGER\p*\study4_negative\*.png');


ValidStudy1NegativeFinger=numel(DirMuraFingerValidStudy1Negative)
ValidStudy2NegativeFinger=numel(DirMuraFingerValidStudy2Negative)
ValidStudy3NegativeFinger=numel(DirMuraFingerValidStudy3Negative)
ValidStudy4NegativeFinger=numel(DirMuraFingerValidStudy4Negative)

totalFingerDataValidStudyPositiveNegative= ValidStudy1PositiveFinger+ValidStudy2PositiveFinger+ValidStudy3PositiveFinger+ValidStudy4PositiveFinger+ValidStudy1NegativeFinger+ValidStudy2NegativeFinger+ValidStudy3NegativeFinger+ValidStudy4NegativeFinger

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ForeArm Train images folder
DirMuraTrainForearm= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_FOREARM\*\*\*.png');
TotalDataMURAXForearmTrainFolder= numel(DirMuraTrainForearm)

DirMuraForearmTrainStudy1Positive=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_FOREARM\p*\study1_positive\*.png');
DirMuraForearmTrainStudy2Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_FOREARM\p*\study2_positive\*.png');
DirMuraForearmTrainStudy3Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_FOREARM\p*\study3_positive\*.png');
DirMuraForearmTrainStudy4Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_FOREARM\p*\study4_positive\*.png');
TrainStudy1PositiveForearm=numel(DirMuraForearmTrainStudy1Positive)
TrainStudy2PositiveForearm=numel(DirMuraForearmTrainStudy2Positive)
TrainStudy3PositiveForearm=numel(DirMuraForearmTrainStudy3Positive)
TrainStudy4PositiveForearm=numel(DirMuraForearmTrainStudy4Positive)

DirMuraForearmTrainStudy1Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_FOREARM\p*\study1_negative\*.png');
DirMuraForearmTrainStudy2Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_FOREARM\p*\study2_negative\*.png');
DirMuraForearmTrainStudy3Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_FOREARM\p*\study3_negative\*.png');
DirMuraForearmTrainStudy4Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_FOREARM\p*\study4_negative\*.png');


TrainStudy1NegativeForearm=numel(DirMuraForearmTrainStudy1Negative)
TrainStudy2NegativeForearm=numel(DirMuraForearmTrainStudy2Negative)
TrainStudy3NegativeForearm=numel(DirMuraForearmTrainStudy3Negative)
TrainStudy4NegativeForearm=numel(DirMuraForearmTrainStudy4Negative)

totalForearmDataTrainStudyPositiveNegative= TrainStudy1PositiveForearm+TrainStudy2PositiveForearm+TrainStudy3PositiveForearm+TrainStudy4PositiveForearm+TrainStudy1NegativeForearm+TrainStudy2NegativeForearm+TrainStudy3NegativeForearm+TrainStudy4NegativeForearm

%ForeArm Valid images folder

DirMuraValidForearm= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_FOREARM\*\*\*.png');
TotalDataMURAXForearmValidFolder= numel(DirMuraValidForearm)

DirMuraForearmValidStudy1Positive=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_FOREARM\p*\study1_positive\*.png');
DirMuraForearmValidStudy2Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_FOREARM\p*\study2_positive\*.png');
DirMuraForearmValidStudy3Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_FOREARM\p*\study3_positive\*.png');
DirMuraForearmValidStudy4Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_FOREARM\p*\study4_positive\*.png');
ValidStudy1PositiveForearm=numel(DirMuraForearmValidStudy1Positive)
ValidStudy2PositiveForearm=numel(DirMuraForearmValidStudy2Positive)
ValidStudy3PositiveForearm=numel(DirMuraForearmValidStudy3Positive)
ValidStudy4PositiveForearm=numel(DirMuraForearmValidStudy4Positive)

DirMuraForearmValidStudy1Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_FOREARM\p*\study1_negative\*.png');
DirMuraForearmValidStudy2Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_FOREARM\p*\study2_negative\*.png');
DirMuraForearmValidStudy3Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_FOREARM\p*\study3_negative\*.png');
DirMuraForearmValidStudy4Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_FOREARM\p*\study4_negative\*.png');


ValidStudy1NegativeForearm=numel(DirMuraForearmValidStudy1Negative)
ValidStudy2NegativeForearm=numel(DirMuraForearmValidStudy2Negative)
ValidStudy3NegativeForearm=numel(DirMuraForearmValidStudy3Negative)
ValidStudy4NegativeForearm=numel(DirMuraForearmValidStudy4Negative)

totalForearmDataValidStudyPositiveNegative= ValidStudy1PositiveForearm+ValidStudy2PositiveForearm+ValidStudy3PositiveForearm+ValidStudy4PositiveForearm+ValidStudy1NegativeForearm+ValidStudy2NegativeForearm+ValidStudy3NegativeForearm+ValidStudy4NegativeForearm


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Hand Train images folder
DirMuraTrainHand= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_HAND\*\*\*.png');
TotalDataMURAXHandTrainFolder= numel(DirMuraTrainHand)

DirMuraHandTrainStudy1Positive=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_HAND\p*\study1_positive\*.png');
DirMuraHandTrainStudy2Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_HAND\p*\study2_positive\*.png');
DirMuraHandTrainStudy3Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_HAND\p*\study3_positive\*.png');
DirMuraHandTrainStudy4Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_HAND\p*\study4_positive\*.png');
TrainStudy1PositiveHand=numel(DirMuraHandTrainStudy1Positive)
TrainStudy2PositiveHand=numel(DirMuraHandTrainStudy2Positive)
TrainStudy3PositiveHand=numel(DirMuraHandTrainStudy3Positive)
TrainStudy4PositiveHand=numel(DirMuraHandTrainStudy4Positive)

DirMuraHandTrainStudy1Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_HAND\p*\study1_negative\*.png');
DirMuraHandTrainStudy2Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_HAND\p*\study2_negative\*.png');
DirMuraHandTrainStudy3Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_HAND\p*\study3_negative\*.png');
DirMuraHandTrainStudy4Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_HAND\p*\study4_negative\*.png');


TrainStudy1NegativeHand=numel(DirMuraHandTrainStudy1Negative)
TrainStudy2NegativeHand=numel(DirMuraHandTrainStudy2Negative)
TrainStudy3NegativeHand=numel(DirMuraHandTrainStudy3Negative)
TrainStudy4NegativeHand=numel(DirMuraHandTrainStudy4Negative)

totalHandDataTrainStudyPositiveNegative= TrainStudy1PositiveHand+TrainStudy2PositiveHand+TrainStudy3PositiveHand+TrainStudy4PositiveHand+TrainStudy1NegativeHand+TrainStudy2NegativeHand+TrainStudy3NegativeHand+TrainStudy4NegativeHand

%Hand valid images folder
DirMuraValidHand= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_HAND\*\*\*.png');
TotalDataMURAXHandValidFolder= numel(DirMuraValidHand)

DirMuraHandValidStudy1Positive=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_HAND\p*\study1_positive\*.png');
DirMuraHandValidStudy2Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_HAND\p*\study2_positive\*.png');
DirMuraHandValidStudy3Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_HAND\p*\study3_positive\*.png');
DirMuraHandValidStudy4Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_HAND\p*\study4_positive\*.png');
ValidStudy1PositiveHand=numel(DirMuraHandValidStudy1Positive)
ValidStudy2PositiveHand=numel(DirMuraHandValidStudy2Positive)
ValidStudy3PositiveHand=numel(DirMuraHandValidStudy3Positive)
ValidStudy4PositiveHand=numel(DirMuraHandValidStudy4Positive)

DirMuraHandValidStudy1Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_HAND\p*\study1_negative\*.png');
DirMuraHandValidStudy2Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_HAND\p*\study2_negative\*.png');
DirMuraHandValidStudy3Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_HAND\p*\study3_negative\*.png');
DirMuraHandValidStudy4Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_HAND\p*\study4_negative\*.png');


ValidStudy1NegativeHand=numel(DirMuraHandValidStudy1Negative)
ValidStudy2NegativeHand=numel(DirMuraHandValidStudy2Negative)
ValidStudy3NegativeHand=numel(DirMuraHandValidStudy3Negative)
ValidStudy4NegativeHand=numel(DirMuraHandValidStudy4Negative)

totalHandDataValidStudyPositiveNegative= ValidStudy1PositiveHand+ValidStudy2PositiveHand+ValidStudy3PositiveHand+ValidStudy4PositiveHand+ValidStudy1NegativeHand+ValidStudy2NegativeHand+ValidStudy3NegativeHand+ValidStudy4NegativeHand

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Humerus Train images folder
DirMuraTrainHumerus= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_HUMERUS\*\*\*.png');
TotalDataMURAXHumerusTrainFolder= numel(DirMuraTrainHumerus)

DirMuraHumerusTrainStudy1Positive=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_HUMERUS\p*\study1_positive\*.png');
DirMuraHumerusTrainStudy2Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_HUMERUS\p*\study2_positive\*.png');
DirMuraHumerusTrainStudy3Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_HUMERUS\p*\study3_positive\*.png');
DirMuraHumerusTrainStudy4Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_HUMERUS\p*\study4_positive\*.png');
TrainStudy1PositiveHumerus=numel(DirMuraHumerusTrainStudy1Positive)
TrainStudy2PositiveHumerus=numel(DirMuraHumerusTrainStudy2Positive)
TrainStudy3PositiveHumerus=numel(DirMuraHumerusTrainStudy3Positive)
TrainStudy4PositiveHumerus=numel(DirMuraHumerusTrainStudy4Positive)

DirMuraHumerusTrainStudy1Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_HUMERUS\p*\study1_negative\*.png');
DirMuraHumerusTrainStudy2Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_HUMERUS\p*\study2_negative\*.png');
DirMuraHumerusTrainStudy3Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_HUMERUS\p*\study3_negative\*.png');
DirMuraHumerusTrainStudy4Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_HUMERUS\p*\study4_negative\*.png');


TrainStudy1NegativeHumerus=numel(DirMuraHumerusTrainStudy1Negative)
TrainStudy2NegativeHumerus=numel(DirMuraHumerusTrainStudy2Negative)
TrainStudy3NegativeHumerus=numel(DirMuraHumerusTrainStudy3Negative)
TrainStudy4NegativeHumerus=numel(DirMuraHumerusTrainStudy4Negative)

totalHumerusDataTrainStudyPositiveNegative= TrainStudy1PositiveHumerus+TrainStudy2PositiveHumerus+TrainStudy3PositiveHumerus+TrainStudy4PositiveHumerus+TrainStudy1NegativeHumerus+TrainStudy2NegativeHumerus+TrainStudy3NegativeHumerus+TrainStudy4NegativeHumerus

%Humerus valid images folder
DirMuraValidHumerus= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_HUMERUS\*\*\*.png');
TotalDataMURAXHumerusValidFolder= numel(DirMuraValidHumerus)

DirMuraHumerusValidStudy1Positive=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_HUMERUS\p*\study1_positive\*.png');
DirMuraHumerusValidStudy2Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_HUMERUS\p*\study2_positive\*.png');
DirMuraHumerusValidStudy3Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_HUMERUS\p*\study3_positive\*.png');
DirMuraHumerusValidStudy4Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_HUMERUS\p*\study4_positive\*.png');
ValidStudy1PositiveHumerus=numel(DirMuraHumerusValidStudy1Positive)
ValidStudy2PositiveHumerus=numel(DirMuraHumerusValidStudy2Positive)
ValidStudy3PositiveHumerus=numel(DirMuraHumerusValidStudy3Positive)
ValidStudy4PositiveHumerus=numel(DirMuraHumerusValidStudy4Positive)

DirMuraHumerusValidStudy1Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_HUMERUS\p*\study1_negative\*.png');
DirMuraHumerusValidStudy2Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_HUMERUS\p*\study2_negative\*.png');
DirMuraHumerusValidStudy3Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_HUMERUS\p*\study3_negative\*.png');
DirMuraHumerusValidStudy4Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_HUMERUS\p*\study4_negative\*.png');


ValidStudy1NegativeHumerus=numel(DirMuraHumerusValidStudy1Negative)
ValidStudy2NegativeHumerus=numel(DirMuraHumerusValidStudy2Negative)
ValidStudy3NegativeHumerus=numel(DirMuraHumerusValidStudy3Negative)
ValidStudy4NegativeHumerus=numel(DirMuraHumerusValidStudy4Negative)

totalHumerusDataValidStudyPositiveNegative= ValidStudy1PositiveHumerus+ValidStudy2PositiveHumerus+ValidStudy3PositiveHumerus+ValidStudy4PositiveHumerus+ValidStudy1NegativeHumerus+ValidStudy2NegativeHumerus+ValidStudy3NegativeHumerus+ValidStudy4NegativeHumerus

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Shoulder Train images folder
DirMuraTrainShoulder= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_SHOULDER\*\*\*.png');
TotalDataMURAXShoulderTrainFolder= numel(DirMuraTrainShoulder)

DirMuraShoulderTrainStudy1Positive=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_SHOULDER\p*\study1_positive\*.png');
DirMuraShoulderTrainStudy2Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_SHOULDER\p*\study2_positive\*.png');
DirMuraShoulderTrainStudy3Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_SHOULDER\p*\study3_positive\*.png');
DirMuraShoulderTrainStudy4Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_SHOULDER\p*\study4_positive\*.png');
TrainStudy1PositiveShoulder=numel(DirMuraShoulderTrainStudy1Positive)
TrainStudy2PositiveShoulder=numel(DirMuraShoulderTrainStudy2Positive)
TrainStudy3PositiveShoulder=numel(DirMuraShoulderTrainStudy3Positive)
TrainStudy4PositiveShoulder=numel(DirMuraShoulderTrainStudy4Positive)

DirMuraShoulderTrainStudy1Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_SHOULDER\p*\study1_negative\*.png');
DirMuraShoulderTrainStudy2Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_SHOULDER\p*\study2_negative\*.png');
DirMuraShoulderTrainStudy3Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_SHOULDER\p*\study3_negative\*.png');
DirMuraShoulderTrainStudy4Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\train\XR_SHOULDER\p*\study4_negative\*.png');


TrainStudy1NegativeShoulder=numel(DirMuraShoulderTrainStudy1Negative)
TrainStudy2NegativeShoulder=numel(DirMuraShoulderTrainStudy2Negative)
TrainStudy3NegativeShoulder=numel(DirMuraShoulderTrainStudy3Negative)
TrainStudy4NegativeShoulder=numel(DirMuraShoulderTrainStudy4Negative)

totalShoulderDataTrainStudyPositiveNegative= TrainStudy1PositiveShoulder+TrainStudy2PositiveShoulder+TrainStudy3PositiveShoulder+TrainStudy4PositiveShoulder+TrainStudy1NegativeShoulder+TrainStudy2NegativeShoulder+TrainStudy3NegativeShoulder+TrainStudy4NegativeShoulder

%Shoulder valid images folder
DirMuraValidShoulder= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_SHOULDER\*\*\*.png');
TotalDataMURAXShoulderValidFolder= numel(DirMuraValidShoulder)

DirMuraShoulderValidStudy1Positive=dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_SHOULDER\p*\study1_positive\*.png');
DirMuraShoulderValidStudy2Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_SHOULDER\p*\study2_positive\*.png');
DirMuraShoulderValidStudy3Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_SHOULDER\p*\study3_positive\*.png');
DirMuraShoulderValidStudy4Positive= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_SHOULDER\p*\study4_positive\*.png');
ValidStudy1PositiveShoulder=numel(DirMuraShoulderValidStudy1Positive)
ValidStudy2PositiveShoulder=numel(DirMuraShoulderValidStudy2Positive)
ValidStudy3PositiveShoulder=numel(DirMuraShoulderValidStudy3Positive)
ValidStudy4PositiveShoulder=numel(DirMuraShoulderValidStudy4Positive)

DirMuraShoulderValidStudy1Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_SHOULDER\p*\study1_negative\*.png');
DirMuraShoulderValidStudy2Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_SHOULDER\p*\study2_negative\*.png');
DirMuraShoulderValidStudy3Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_SHOULDER\p*\study3_negative\*.png');
DirMuraShoulderValidStudy4Negative= dir('C:\Users\aczf102\OneDrive - City, University of London\Documents\MATLAB\MURA_v1_1\MURA_v1_1\valid\XR_SHOULDER\p*\study4_negative\*.png');


ValidStudy1NegativeShoulder=numel(DirMuraShoulderValidStudy1Negative)
ValidStudy2NegativeShoulder=numel(DirMuraShoulderValidStudy2Negative)
ValidStudy3NegativeShoulder=numel(DirMuraShoulderValidStudy3Negative)
ValidStudy4NegativeShoulder=numel(DirMuraShoulderValidStudy4Negative)

totalShoulderDataValidStudyPositiveNegative= ValidStudy1PositiveShoulder+ValidStudy2PositiveShoulder+ValidStudy3PositiveShoulder+ValidStudy4PositiveShoulder+ValidStudy1NegativeShoulder+ValidStudy2NegativeShoulder+ValidStudy3NegativeShoulder+ValidStudy4NegativeShoulder

