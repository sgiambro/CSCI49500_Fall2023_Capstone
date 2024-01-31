---------------------------------------------------------------------------
% groundTruthMultisignal to groundTruth segment

% this section takes the data from a groundTruthMultisignal and converts it
% into a groundTruth because they are easier to work with



% Extract gTruth data to workspace
groundTruthLabeler("dsfkjdfs.mat");

% Extract gTruth data to workspace
% If this route skip to line 28 and comment the rest out
% videoLabeler("dsfkjdfs.mat");


% Replace parameters to fit gTruth name and needed cloumn
regionGTM = selectLabelsByLabelName(gTruthS2, 'eyes');

labeldataGT = removevars(regionGTM.LabelDefinitions, {'SignalType'});
labeldataGT = removevars(labeldataGT, {'Description'});
labeldataGT = removevars(labeldataGT, {'Group'});
% Replace to fit needed column  ex. if face detector remove eyes, hands, mounth
labeldataGT(ismember(labeldataGT.Name,'face'),:) = [];
labeldataGT(ismember(labeldataGT.Name,'hands'),:) = [];
labeldataGT(ismember(labeldataGT.Name,'mouth'),:) = [];
labeldataGT(ismember(labeldataGT.LabelType,5),:) = [];


% Creates groundTruth from groundTruthMultisignal
% Change source video name to match data
regionGT = groundTruth(groundTruthDataSource("V3 SideView 2.mp4"), ...
                       labeldataGT, ...
                       regionGTM.ROILabelData.video_V3SideView2);


---------------------------------------------------------------------------
% IOU Segment


% runs through all 1001 frames and gets the label data for the specified
% region. then compares the manual GT labels to the detectors GT labels and
% calculates the IoU.
% Issue - there is no way to determine which bbox is for which object in
% the frame so for hands esspecily this will be a problem not so much with
% the other regions

for x = 1:1001
                     % Change GT var as needed
    ourBB = cell2mat(gtruth_pred_side2.LabelData.Eye(x,:));
    detectionBB = cell2mat(gTruthSideView2.LabelData.Eye(x,:));

    ourRowSize = size(ourBB);
    detectionRowSize = size(detectionBB);
    
    % use 1:2 for face, eyes, mouth. for hands use commented code
    for y = 1:2 %1:(max(ourRowSize(1,1), detectionRowSize(1,1)))
        
        % true cases
        if y <= min(ourRowSize(1,1), detectionRowSize(1,1))
            ioUTable(x,y) = bboxOverlapRatio(ourBB(y,:),detectionBB(y,:),"Union");
       
        % false cases
        elseif y > min(ourRowSize(1,1), detectionRowSize(1,1))
            % false negative
            if ourRowSize(1,1) > detectionRowSize(1,1)
                ioUTable(x,y) = 2;
            % false positive
            elseif ourRowSize(1,1) < detectionRowSize(1,1)
                ioUTable(x,y) = 3;
            end

        end

    end

end

% Run 10 times should be two videos per session that apply
% t 1-10 as you get IoU data
% t1 = ioUTable;


% then run this code to join all 10 tables together
% eyesIoU = [t1, t2, t3, t4, t5, t6, t7, t8, t9, t10];





