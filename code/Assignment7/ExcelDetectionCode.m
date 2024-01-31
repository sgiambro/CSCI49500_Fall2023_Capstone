% THIS IS THE ONLY SECTION THAT NEEDS TO BE ALTERED
% Put own pathway and range (top left to bottom right)
excelView1Eyes = readtable("Actual Detection Folder\V3 Detections\V3_S1_Detection.xlsx","Range", "B2:L1002");
excelView1Face = readtable("Actual Detection Folder\V3 Detections\V3_S1_Detection.xlsx","Range", "N2:Y1002");
excelView1Mouth = readtable("Actual Detection Folder\V3 Detections\V3_S1_Detection.xlsx","Range", "AA2:AH1002");
excelView1Hands = readtable("Actual Detection Folder\V3 Detections\Hands\V3_S1_Detection2.xlsx","Range", "B2:AG1002");

excelView2Eyes = readtable("Actual Detection Folder\V3 Detections\V3_S2_Detection.xlsx","Range", "B2:Q1002");
excelView2Face = readtable("Actual Detection Folder\V3 Detections\V3_S2_Detection.xlsx","Range", "R2:AC1002");
excelView2Mouth = readtable("Actual Detection Folder\V3 Detections\V3_S2_Detection.xlsx","Range", "BN2:BY1002");
excelView2Hands = readtable("Actual Detection Folder\V3 Detections\Hands\V3_S2_Detection2.xlsx","Range", "B2:AK1002");

excelView3Hands = readtable("Actual Detection Folder\V3 Detections\Hands\V3_Top_Detection2.xlsx","Range", "B2:AO1002");

%--------------------------------------------------------------------------------------------------------------------------------------

% this section takes the old detection data and reformats it

V1_Ae = [];
V1_Af = [];
V1_Am = [];
V1_Ah = [];

V2_Ae = [];
V2_Af = [];
V2_Am = [];
V2_Ah = [];

V3_Ae = [];
V3_Af = [];
V3_Am = [];
V3_Ah = [];

% Each for loop takes the old data and runs through it row by row.
% each detected object in the row is put into the new table as its own
% seperate row but with the same frame number as the same row objects.

for xs = 1:1001
    s = getSize(excelView1Eyes, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = excelView1Eyes{xs, i};
        y = excelView1Eyes{xs, (i + objectNum)};
        w = excelView1Eyes{xs, (i + objectNum*2)};
        h = excelView1Eyes{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        V1_Ae = [V1_Ae ; [xs, xPos, yPos, x, y, w, h]];
    end


    s = getSize(excelView1Face, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = excelView1Face{xs, i};
        y = excelView1Face{xs, (i + objectNum)};
        w = excelView1Face{xs, (i + objectNum*2)};
        h = excelView1Face{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        V1_Af = [V1_Af ; [xs, xPos, yPos, x, y, w, h]];
    end

    s = getSize(excelView1Mouth, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = excelView1Mouth{xs, i};
        y = excelView1Mouth{xs, (i + objectNum)};
        w = excelView1Mouth{xs, (i + objectNum*2)};
        h = excelView1Mouth{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        V1_Am = [V1_Am ; [xs, xPos, yPos, x, y, w, h]];
    end

    
    s = getSize(excelView1Hands, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = excelView1Hands{xs, i};
        y = excelView1Hands{xs, (i + objectNum)};
        w = excelView1Hands{xs, (i + objectNum*2)};
        h = excelView1Hands{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        V1_Ah = [V1_Ah ; [xs, xPos, yPos, x, y, w, h]];
    end

%----------

    s = getSize(excelView2Eyes, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = excelView2Eyes{xs, i};
        y = excelView2Eyes{xs, (i + objectNum)};
        w = excelView2Eyes{xs, (i + objectNum*2)};
        h = excelView2Eyes{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        V2_Ae = [V2_Ae ; [xs, xPos, yPos, x, y, w, h]];
    end


    s = getSize(excelView2Face, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = excelView2Face{xs, i};
        y = excelView2Face{xs, (i + objectNum)};
        w = excelView2Face{xs, (i + objectNum*2)};
        h = excelView2Face{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        V2_Af = [V2_Af ; [xs, xPos, yPos, x, y, w, h]];
    end

    s = getSize(excelView2Mouth, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = excelView2Mouth{xs, i};
        y = excelView2Mouth{xs, (i + objectNum)};
        w = excelView2Mouth{xs, (i + objectNum*2)};
        h = excelView2Mouth{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        V2_Am = [V2_Am ; [xs, xPos, yPos, x, y, w, h]];
    end

    
    s = getSize(excelView2Hands, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = excelView2Hands{xs, i};
        y = excelView2Hands{xs, (i + objectNum)};
        w = excelView2Hands{xs, (i + objectNum*2)};
        h = excelView2Hands{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        V2_Ah = [V2_Ah ; [xs, xPos, yPos, x, y, w, h]];
    end

%---------

    s = getSize(excelView3Hands, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = excelView3Hands{xs, i};
        y = excelView3Hands{xs, (i + objectNum)};
        w = excelView3Hands{xs, (i + objectNum*2)};
        h = excelView3Hands{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        V3_Ah = [V3_Ah ; [xs, xPos, yPos, x, y, w, h]];
    end


end





function size = getSize(excelData , index)
    columnCount = width(excelData(1,:));

    for i = 1:columnCount
        if isnan(excelData{index, i})
            size = (i-1);
            break;
        elseif i == columnCount
            size = i;
            break;
        
        end
    end
end


%{ 
This function didnt work but i dont know why

function getRowData(excelData, index, outPutTable, rowSize)
    objectNum = (rowSize/4);
    
    for i = 1:objectNum
        x = excelData{index, i};
        y = excelData{index, (i + objectNum)};
        w = excelData{index, (i + objectNum*2)};
        h = excelData{index, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
    
        outPutTable = [outPutTable ; [index, xPos, yPos, x, y, w, h]];
    end

end

%} 


%---------------------------------------------------------------------------------------------------------------------------------

% This section saves all the data has been collected into excel files

%{

writematrix(V1_Ae,"Ae.xlsx");
writematrix(V1_Af,"Af.xlsx");
writematrix(V1_Am,"Am.xlsx");
writematrix(V1_Ah,"Ah.xlsx");

writematrix(V2_Ae,"Ae.xlsx");
writematrix(V2_Af,"Af.xlsx");
writematrix(V2_Am,"Am.xlsx");
writematrix(V2_Ah,"Ah.xlsx");

writematrix(V3_Ae,"Ae.xlsx");
writematrix(V3_Af,"Af.xlsx");
writematrix(V3_Am,"Am.xlsx");
writematrix(V3_Ah,"Ah.xlsx");

%}
