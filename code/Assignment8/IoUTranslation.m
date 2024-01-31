% variable section

V1Side3From1 = readtable("session1\projections1to3.xlsx");
V1Side3From2 = readtable("session1\projections2to3.xlsx");
V1Side1From3 = readtable("session1\projections3to1.xlsx");
V1Side2From3 = readtable("session1\projections3to2.xlsx");

%V2Side3From1 = readtable("session2\projections1to3.xlsx");
V2Side3From2 = readtable("session2\projections2to3.xlsx");
%V2Side1From3 = readtable("session2\projections3to1.xlsx");
V2Side2From3 = readtable("session2\projections3to2.xlsx");

V3Side3From1 = readtable("session3\projections1to3.xlsx");
V3Side3From2 = readtable("session3\projections2to3.xlsx");
V3Side1From3 = readtable("session3\projections3to1.xlsx");
V3Side2From3 = readtable("session3\projections3to2.xlsx");

V4Side3From1 = readtable("session4\projections1to3.xlsx");
V4Side3From2 = readtable("session4\projections2to3.xlsx");
V4Side1From3 = readtable("session4\projections3to1.xlsx");
V4Side2From3 = readtable("session4\projections3to2.xlsx");

V5Side3From1 = readtable("session5\projections1to3.xlsx");
V5Side3From2 = readtable("session5\projections2to3.xlsx");
V5Side1From3 = readtable("session5\projections3to1.xlsx");
V5Side2From3 = readtable("session5\projections3to2.xlsx");

%--------------------------------------------------------------------------

IoUV1Side3From1 = [];
IoUV1Side3From2 = [];
IoUV1Side1From3 = [];
IoUV1Side2From3 = [];

%IoUV2Side3From1 = [];
IoUV2Side3From2 = [];
%IoUV2Side1From3 = [];
IoUV2Side2From3 = [];

IoUV3Side3From1 = [];
IoUV3Side3From2 = [];
IoUV3Side1From3 = [];
IoUV3Side2From3 = [];

IoUV4Side3From1 = [];
IoUV4Side3From2 = [];
IoUV4Side1From3 = [];
IoUV4Side2From3 = [];

IoUV5Side3From1 = [];
IoUV5Side3From2 = [];
IoUV5Side1From3 = [];
IoUV5Side2From3 = [];

%--------------------------------------------------------------------------

% IoU section


IoUV1Side1From3 = translationIoU(GT1V1_Ah, V1Side1From3, IoUV1Side1From3);
IoUV1Side2From3 = translationIoU(GT1V2_Ah, V1Side2From3, IoUV1Side2From3);
IoUV1Side3From1 = translationIoU(GT1V3_Ah, V1Side3From1, IoUV1Side3From1);
IoUV1Side3From2 = translationIoU(GT1V3_Ah, V1Side3From2, IoUV1Side3From2);

%IoUV2Side1From3 = translationIoU(GT2V1_Ah, V2Side1From3, IoUV2Side1From3);
IoUV2Side2From3 = translationIoU(GT2V2_Ah, V2Side2From3, IoUV2Side2From3);
%IoUV2Side3From1 = translationIoU(GT2V3_Ah, V2Side3From1, IoUV2Side3From1);
IoUV2Side3From2 = translationIoU(GT2V3_Ah, V2Side3From2, IoUV2Side3From2);

IoUV3Side1From3 = translationIoU(GT3V1_Ah, V3Side1From3, IoUV3Side1From3);
IoUV3Side2From3 = translationIoU(GT3V2_Ah, V3Side2From3, IoUV3Side2From3);
IoUV3Side3From1 = translationIoU(GT3V3_Ah, V3Side3From1, IoUV3Side3From1);
IoUV3Side3From2 = translationIoU(GT3V3_Ah, V3Side3From2, IoUV3Side3From2);

IoUV4Side1From3 = translationIoU(GT4V1_Ah, V4Side1From3, IoUV4Side1From3);
IoUV4Side2From3 = translationIoU(GT4V2_Ah, V4Side2From3, IoUV4Side2From3);
IoUV4Side3From1 = translationIoU(GT4V3_Ah, V4Side3From1, IoUV4Side3From1);
IoUV4Side3From2 = translationIoU(GT4V3_Ah, V4Side3From2, IoUV4Side3From2);

IoUV5Side1From3 = translationIoU(GT5V1_Ah, V5Side1From3, IoUV5Side1From3);
IoUV5Side2From3 = translationIoU(GT5V2_Ah, V5Side2From3, IoUV5Side2From3);
IoUV5Side3From1 = translationIoU(GT5V3_Ah, V5Side3From1, IoUV5Side3From1);
IoUV5Side3From2 = translationIoU(GT5V3_Ah, V5Side3From2, IoUV5Side3From2);



% This function gets the IoU data from the projections.
% it steps through the ground truth data row by row comparing it to
% the projection bboxes. Since the projections might not have the same
% number of bboxes per frame both tables compare data for the same frame
% until either one of them runs out of objects for that frame. The one who
% runs out stops iterating while the other table keeps comparing bboxes for
% that frame giving either a false pos or neg depending on who has more
% detected objects.

%Issue:
% We have no way of determining which detected object coresponds with which
% person on the video so we cannot accuratly compare the bboxes to one
% another


function iouTable = translationIoU(gtruth, detection, iouTable)
    detectionIndex = 1;
    gTFrame = 1;

    for x = 1:height(gtruth)

        % next GT frame
        if gtruth(x,1) == detection{detectionIndex,1} && gtruth(x,1) ~= gTFrame
            gTFrame = gTFrame + 1;

            tempbb1 = [gtruth(x,4:7)];
            tempbb2 = [detection{detectionIndex,4:7}];

            iouTable = [iouTable ; [gTFrame, bboxOverlapRatio(tempbb1,tempbb2)]];

            detectionIndex = detectionIndex + 1;

        % false negative
        elseif gtruth(x,1) ~= detection{detectionIndex,1} && gtruth(x,1) == gTFrame
            iouTable = [iouTable ; [gTFrame, 2]];

        elseif gtruth(x,1) ~= detection{detectionIndex,1} && gtruth(x,1) ~= gTFrame
            gTFrame = gTFrame + 1;
            iouTable = [iouTable ; [gTFrame, 2]];
        
        % false positive
        elseif gtruth(x,1) - 1 == detection{detectionIndex,1} && gtruth(x,1) == gTFrame
            iouTable = [iouTable ; [gTFrame, 3]];

            x = x - 1;
            detectionIndex = detectionIndex + 1;
        
        % Standard
        elseif gtruth(x,1) == detection{detectionIndex,1}
            tempbb1 = [gtruth(x,4:7)];
            tempbb2 = [detection{detectionIndex,4:7}];

            iouTable = [iouTable ; [gTFrame, bboxOverlapRatio(tempbb1,tempbb2)]];

            detectionIndex = detectionIndex + 1;
        
        end

        if detectionIndex > height(detection)
            detectionIndex = detectionIndex - 1;
        end


    end

end


%--------------------------------------------------------------------------

% data save section


%writematrix(IoUV1Side3From1,"IoU_Session1_1to3.xlsx");
%writematrix(IoUV1Side3From2,"IoU_Session1_2to3.xlsx");
%writematrix(IoUV1Side1From3,"IoU_Session1_3to1.xlsx");
%writematrix(IoUV1Side2From3,"IoU_Session1_3to2.xlsx");
