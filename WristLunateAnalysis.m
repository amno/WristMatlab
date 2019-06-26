
clear all;
%close all;
% readDicom = dicomread('C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT10\STD1\SER2\IMG0'); % PA with 
% infoDicom=dicominfo('C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT10\STD1\SER2\IMG0');

% readDicom = dicomread('C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT1\STD1\SER1\IMG0'); % LA with extreme aligned result
% infoDicom = dicominfo('C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT1\STD1\SER1\IMG0');

% dicomread('C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT2\STD1\SER1\IMG0'); %Double
% infoDicom = dicominfo('C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT2\STD1\SER1\IMG0');

% readDicom = dicomread('C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT3\STD1\SER1\IMG0');  % LA
% infoDicom = dicominfo('C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT3\STD1\SER1\IMG0');

readDicom = dicomread('C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT6\STD1\SER1\IMG0');  % LA -good
infoDicom = dicominfo('C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT6\STD1\SER1\IMG0');

% readDicom = dicomread('C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT8\STD1\SER1\IMG0');  % LA -good
% infoDicom = dicominfo('C:\Users\aczf102\Documents\MATLAB\Data\Normals\N1\PAT8\STD1\SER1\IMG0');

readDicomD=double(readDicom);

BW= edge(readDicom,'canny');
[H, theta, rho] = hough(BW);
P = houghpeaks(H,1);
%P = houghpeaks(H,2);
thetaPeak = theta(P(1,2));
dicomRotate2 = imrotate(readDicom,thetaPeak);
                    
                    
dicomRotRemoveEdge2=removeDicomEdges(dicomRotate2);

            % pixel-value cross-sections along line segments
                     AxisX = [0 size(dicomRotRemoveEdge2,2)];
                     AxisY = [size(dicomRotRemoveEdge2,1)/2 size(dicomRotRemoveEdge2,1)/2];
                     AxisY1 = [size(dicomRotRemoveEdge2,1)/3 size(dicomRotRemoveEdge2,1)/3];
                     profileDicom =improfile(dicomRotRemoveEdge2,AxisX,AxisY1);
                     
%                      [minvalue, index_of_min] = min(profileDicom);
%                      [maxvalue, index_of_max] = max(profileDicom);                     

                     edgeDicom = edge(dicomRotRemoveEdge2,'Canny');
                     
                     dicomRotRemoveEdge3 = RemoveDicomEdges2(dicomRotRemoveEdge2);
                     
                    
                     %crop image from the hand and above
                     cropDicomImage = imcrop(dicomRotRemoveEdge2,[AxisX,AxisY]);
                     cropDicomImageD=double(cropDicomImage);
                     
                     %[rows,cols]        = size(readDicom);
                     [rows,cols] =size(cropDicomImage);
                     [rows3,cols3]        = size(dicomRotate2);
                     
%                      cumIntProj_Rot_Col          = sum(readDicom)/rows;  
%                      cumIntProj_Rot_Row          = sum(readDicom,2)/cols;
                       
                       cumIntProj_Rot_Col = sum(cropDicomImage)/rows;
                       cumIntProj_Rot_Row = sum(cropDicomImage,2)/cols;
                    
                     
%                     cumIntProj_Rot_Col = mean(cropDicomImage,1);
%                     cumIntProj_Rot_Row = mean(cropDicomImage,2)
                        
                     %pks = findpeaks(dicomRotRemoveEdge2);
                     maxIntensity            = max(cropDicomImage(:));
                     maxIntensityD           = double(maxIntensity);
                     %otsuLevel               = maxIntensityD*(graythresh(readDicomD/maxIntensityD));  %important to notice -threshold 
                     otsuLevel               = maxIntensityD*(graythresh(cropDicomImageD/maxIntensityD));
                    [pks_Col,locs_Col,w_Col,p_Col] = findpeaks(cumIntProj_Rot_Col,'MinPeakDistance',30,'MinPeakHeight',otsuLevel,'MinPeakWidth',3,'MaxPeakWidth',180);
                    [pks_Row,locs_Row,w_Row,p_Row] = findpeaks(cumIntProj_Rot_Row,'MinPeakDistance',30,'MinPeakHeight',otsuLevel,'MinPeakWidth',3,'MaxPeakWidth',180);

                    % if more than 2, take only the extremes

                        if numel(pks_Col)>2
                            pks_Col     = pks_Col([1 end]);
                            locs_Col    = locs_Col([1 end]);
                            w_Col       = w_Col([1 end]);
                            p_Col       = p_Col([1 end]);
                        end
                        if numel(pks_Row)>2
                            pks_Row     = pks_Row([1 end]);
                            locs_Row    = locs_Row([1 end]);
                            w_Row       = w_Row([1 end]);
                            p_Row       = p_Row([1 end]);
                        end
                    

                     % If there is only one peak, it may be above/below or left/right
                        if numel(pks_Col)==1
                            if locs_Col>(cols/2)
                                %right
                                ColsLeft  = otsuLevel;
                                if ((locs_Col(1)+w_Col(end))>cols3)
                                    % The peak is near the border, eliminate
                                    ColsRight = 0;
                                else
                                    ColsRight = mean(cumIntProj_Rot_Col(floor(locs_Col(1)+w_Col(end)):end));
                                end


                            else
                                %left
                                if locs_Col(1)<w_Col(1)
                                    % The peak is near the border, eliminate
                                    ColsLeft = 0;
                                else
                                    ColsLeft  = mean(cumIntProj_Rot_Col(1:floor(locs_Col(1)-w_Col(1))  ));
                                end

                                ColsRight = otsuLevel;
                            end
                        elseif numel(pks_Col)==0
                            ColsLeft  = otsuLevel;
                            ColsRight = otsuLevel;
                        else
                            if locs_Col(1)<w_Col(1)
                                % The peak is near the border, eliminate
                                ColsLeft = 0;
                            else
                                ColsLeft  = mean(cumIntProj_Rot_Col(1:floor(locs_Col(1)-w_Col(1))  ));
                            end
                            if ((locs_Col(2)+w_Col(end))>cols3)
                                % The peak is near the border, eliminate
                                ColsRight = 0;
                            else
                                ColsRight = mean(cumIntProj_Rot_Col(floor(locs_Col(2)+w_Col(end)):end));
                            end
                        end


                        % To guarantee that these are edges, check that the intensity before and after is
                        % very low
                        if numel(pks_Row)==1
                            if locs_Row>(rows/2)
                                % below
                                if (locs_Row(1)+w_Row(end))>rows3
                                    RowsBelow = 0;
                                else
                                    RowsBelow = mean(cumIntProj_Rot_Row(floor(locs_Row(1)+w_Row(end)):end));
                                end
                                RowsAbove = otsuLevel;
                            else
                                % above
                                RowsBelow = otsuLevel;
                                if (locs_Row(1)<(w_Row(1)+1))
                                    RowsAbove = 0;
                                else
                                    RowsAbove = mean(cumIntProj_Rot_Row(1:floor(locs_Row(1)-w_Row(1))));
                                end
                            end
                        elseif numel(pks_Row)==0
                            RowsAbove=otsuLevel;
                            RowsBelow=otsuLevel;
                        else
                            if (locs_Row(1)<(w_Row(1)+1))
                                RowsAbove = 0;
                            else
                                RowsAbove = mean(cumIntProj_Rot_Row(1:floor(locs_Row(1)-w_Row(1))));
                            end
                            if (locs_Row(2)+w_Row(end))>rows3
                                RowsBelow = 0;
                            else
                                RowsBelow = mean(cumIntProj_Rot_Row(floor(locs_Row(2)+w_Row(end)):end));
                            end
                        end
                        %
                %edgeremoval 
                marginRemove = 30;
                %newDicom = dicomRotate2;
                newDicom = cropDicomImage;
                %LeftColumn
                    initCol = max(1,round( locs_Col(1)-w_Col(1)-marginRemove ));
                    finCol  = min(cols3,round(marginRemove+locs_Col(1)+w_Col(1)  ));
                    newDicom(:,initCol:finCol) = ColsLeft;

                 %RightColumn

                    initCol = max(1,round( locs_Col(end)-w_Col(end)-marginRemove ));
                    finCol  = min(cols3,round(marginRemove+locs_Col(end)+w_Col(end)  ));
                    newDicom(:,initCol:finCol) = ColsRight;

% %                  %RowAbove
%                     initRow = max(1,round( locs_Row(1)-w_Row(1)-marginRemove));
%                     finRow = min(rows3,round(marginRemove+locs_Row(1)+w_Row(1)  ));
%                     newDicom(initRow:finRow,:) = RowsAbove;
% 
%                  %RowBelow
%                     initRow = max(1,round( locs_Row(end)-w_Row(end)-marginRemove));
%                     finRow = min(rows3,round(marginRemove+locs_Row(end)+w_Row(end) ) );
%                     newDicom(initRow:finRow,:) = RowsBelow;

                % Return to initial position
                %Xray5                   = imrotate(Xray4,-angleRot);
                [rows5,cols5] = size(newDicom);
                rows6 = floor((rows5-rows)/2);
                cols6 = floor((cols5-cols)/2);
                Xray6 = newDicom(rows6+1:end,cols6+1:end);
                Xray6(rows+1:end,:)=[];
                Xray6(:,cols+1:end)=[];                    
                     
                     
                  
                     
figure, 
subplot(1,2,1), imagesc(readDicom),colormap bone, title('original dicom');
subplot(1,2,2), plot(mean(readDicom,2)), title('mean values of original dicom ');

figure,
subplot(1,2,1), imagesc(dicomRotRemoveEdge2),colormap bone, title('edge aligned and edge removed');
subplot(1,2,2), plot(mean(dicomRotRemoveEdge2,2)), title('mean values of edge aligned and edge removed'); 

figure,
subplot(1,2,2), plot(profileDicom),title('pixel-value cross-sections');
subplot(1,2,1), imagesc(dicomRotRemoveEdge2),colormap bone,hold on , plot(AxisX,AxisY,'r'),title('mixed')
%subplot(1,5,5),imshow(edgeDicom), title('Edge of Cropped Image');

 figure,
 imagesc(cropDicomImage),colormap bone, title('location based cropped');
 %subplot(1,2,1),%subplot(1,2,2), ,title('image data peaks')
 
 figure,
 imagesc(newDicom),colormap bone, title('boundary');






                      
