function Xray6 = removeDicomEdges2(Xray)

%% Begin the process of rotation

maxIntensity            = max(Xray(:));
maxIntensity            = double(maxIntensity);

[rows,cols,levels]   = size(Xray);
Xray2                   = double(Xray);
centreShift             = 60;
Xray_Centre             = (Xray2(centreShift:end-centreShift,centreShift:end-centreShift));

otsuLevel               = maxIntensity*(graythresh(Xray2/maxIntensity));
otsuLevel2              = maxIntensity*(graythresh(Xray_Centre/maxIntensity));
otsuLevel3              = otsuLevel*1.5;

% Remove the centre to concentrate on the outer region to remove
Xray2_CentRem           = Xray2;
%Xray2_CentRem(floor((rows-rows/4:rows+rows/4)/2),floor((cols-cols/4:cols+cols/4)/2))=0;
%Xray2_CentRem(floor((rows-rows/2:rows+rows/2)/2),floor((cols-cols/2:cols+cols/2)/2))=0;

Xray2_CentRem(1:floor((rows-rows/4)/2),:)=0;

% Find the hough transform and its peaks, 2 should be related to the borders of the
% collimator and the other should be bone, but the collimator should be stronger,
% especially since the centre is removed.
[H,T,R]                 = hough(Xray2_CentRem>(otsuLevel3),'ThetaResolution',1);
P                       = houghpeaks(H,3,'threshold',ceil(0.3*max(H(:))));

% P1                       = houghpeaks(H1,3,'threshold',ceil(0.3*max(H1(:))));

%  EXTRA CONDITIONS FOR ROTATION
%     1 THE ANGLE CANNOT EXCEED A CERTAIN MARGIN E.G. 15-20
%     2 THE LINES CANNOT GO THROUGH THE CENTRE, IF SO, THEY ARE NOT GIVEN BY THE BOX
%     BUT RATHER BY THE BONES THEMSELVES ???


% The angle of rotation is the median value of the angles of the traces of the hough
% transform
angleLines              = T(P(:,2));
%disp(T(P(:,2)));
angleLines(abs(angleLines)>38)=[];
if numel(angleLines>1)
    angleRot                = median(angleLines);
    % Rotate the image and re-calculate dimensions
    Xray3                   = imrotate(Xray2,angleRot);
else
    Xray3 = Xray2;
    angleRot = 0;
end

[rows,cols,levels]   = size(Xray);
[rows3,cols3,levels] = size(Xray3);


% Calculate the mean values of the rows and cols to remove if necessary
cumIntProj_Or               = sum(Xray2)/rows;
cumIntProj_Rot_Col          = sum(Xray3)/rows;
cumIntProj_Rot_Row          = sum(Xray3,2)/cols;


% Eliminate the lines at the edges of the picture
% Find peaks for both cols and rows
% Peaks have to be:
% 1 above otsuThreshold
% 2 Not too thin, not to wide   3<width<100
% 3 Not close to each other >20
[pks_Col,locs_Col,w_Col,p_Col] = findpeaks(cumIntProj_Rot_Col,'MinPeakDistance',30,'MinPeakHeight',otsuLevel2,'MinPeakWidth',3,'MaxPeakWidth',180);
[pks_Row,locs_Row,w_Row,p_Row] = findpeaks(cumIntProj_Rot_Row,'MinPeakDistance',30,'MinPeakHeight',otsuLevel2,'MinPeakWidth',3,'MaxPeakWidth',180);

%
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


%remove the edges of boxes
Xray4               = Xray3;
marginRemove        = 30;
if(ColsLeft<(otsuLevel/10))
    %remove if the level is very low)
    initCol = max(1,round( locs_Col(1)-w_Col(1)-marginRemove ));
    finCol  = min(cols3,round(marginRemove+locs_Col(1)+w_Col(1)  ));
    Xray4(:,initCol:finCol) = ColsLeft;
end
if(ColsRight<(otsuLevel/10))
    %remove if the level is very low)
    initCol = max(1,round( locs_Col(end)-w_Col(end)-marginRemove ));
    finCol  = min(cols3,round(marginRemove+locs_Col(end)+w_Col(end)  ));
    Xray4(:,initCol:finCol) = ColsRight;
end


if(RowsAbove<(otsuLevel/10))
    %remove if the level is very low)
    initRow = max(1,round( locs_Row(1)-w_Row(1)-marginRemove));
    finRow = min(rows3,round(marginRemove+locs_Row(1)+w_Row(1)  ));
    Xray4(initRow:finRow,:) = RowsAbove;
end
if(RowsBelow<(otsuLevel/10))
    %remove if the level is very low)
    initRow = max(1,round( locs_Row(end)-w_Row(end)-marginRemove));
    finRow = min(rows3,round(marginRemove+locs_Row(end)+w_Row(end) ) );
    Xray4(initRow:finRow,:) = RowsBelow;
end

% Return to initial position
Xray5                   = imrotate(Xray4,-angleRot);
%cumIntProj_Fin               = sum(Xray4)/rows;

[rows5,cols5] = size(Xray5);
rows6 = floor((rows5-rows)/2);
cols6 = floor((cols5-cols)/2);
Xray6 = Xray5(rows6+1:end,cols6+1:end);
Xray6(rows+1:end,:)=[];
Xray6(:,cols+1:end)=[];

