% THIS IS THE ONLY SECTION THAT NEEDS TO BE ALTERED
% Put own pathway and range (top left to bottom right)
GT1View1Hands = readtable("V1_Side1_GT.xlsx","Range", "AX2:CK1002");
GT1View2Hands = readtable("V1_Side2_GT.xlsx","Range", "Z2:BI1002");
GT1View3Hands = readtable("V1_Top_GT.xlsx","Range", "E2:AN1002");

%GT2View1Hands = readtable("V1_Side1_GT.xlsx","Range", "");
GT2View2Hands = readtable("V2_Side2_GT.xlsx","Range", "Z2:BE1002");
GT2View3Hands = readtable("V2_Top_GT.xlsx","Range", "B2:AG1002");

GT3View1Hands = readtable("V3_Side1_GT.xlsx","Range", "Z2:BE1002");
GT3View2Hands = readtable("V3_Side2_GT.xlsx","Range", "B2:BE1002");
GT3View3Hands = readtable("V3_Top_GT.xlsx","Range", "B2:AG1002");

GT4View1Hands = readtable("V4_Side1_GT.xlsx","Range", "Z2:BE1002");
GT4View2Hands = readtable("V4_Side2_GT.xlsx","Range", "V2:BA1002");
GT4View3Hands = readtable("V4_Top_GT.xlsx","Range", "B2:AK1002");

GT5View1Hands = readtable("V5_Side1_GT.xlsx","Range", "Z2:BE1002");
GT5View2Hands = readtable("V5_Side2_GT.xlsx","Range", "Z2:BE1002");
GT5View3Hands = readtable("V5_Top_GT.xlsx","Range", "B2:AG1002");


%--------------------------------------------------------------------------------------------------------------------------------------

% this section takes the old hand detection data and reformats it

GT1V1_Ah = [];
GT1V2_Ah = [];
GT1V3_Ah = [];

%GT2V1_Ah = [];
GT2V2_Ah = [];
GT2V3_Ah = [];

GT3V1_Ah = [];
GT3V2_Ah = [];
GT3V3_Ah = [];

GT4V1_Ah = [];
GT4V2_Ah = [];
GT4V3_Ah = [];

GT5V1_Ah = [];
GT5V2_Ah = [];
GT5V3_Ah = [];


% Each for loop takes the old data and runs through it row by row.
% each detected hand in the row is put into the new table as its own
% seperate row but with the same frame number as the same row hands.

for xs = 1:1001
    s = getSize(GT1View1Hands, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = GT1View1Hands{xs, i};
        y = GT1View1Hands{xs, (i + objectNum)};
        w = GT1View1Hands{xs, (i + objectNum*2)};
        h = GT1View1Hands{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        GT1V1_Ah = [GT1V1_Ah ; [xs, xPos, yPos, x, y, w, h]];
    end

    s = getSize(GT1View2Hands, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = GT1View2Hands{xs, i};
        y = GT1View2Hands{xs, (i + objectNum)};
        w = GT1View2Hands{xs, (i + objectNum*2)};
        h = GT1View2Hands{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        GT1V2_Ah = [GT1V2_Ah ; [xs, xPos, yPos, x, y, w, h]];
    end

    s = getSize(GT1View3Hands, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = GT1View3Hands{xs, i};
        y = GT1View3Hands{xs, (i + objectNum)};
        w = GT1View3Hands{xs, (i + objectNum*2)};
        h = GT1View3Hands{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        GT1V3_Ah = [GT1V3_Ah ; [xs, xPos, yPos, x, y, w, h]];
    end

%--------------------------------------------------------------------------


    s = getSize(GT2View2Hands, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = GT2View2Hands{xs, i};
        y = GT2View2Hands{xs, (i + objectNum)};
        w = GT2View2Hands{xs, (i + objectNum*2)};
        h = GT2View2Hands{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        GT2V2_Ah = [GT2V2_Ah ; [xs, xPos, yPos, x, y, w, h]];
    end

    s = getSize(GT2View3Hands, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = GT2View3Hands{xs, i};
        y = GT2View3Hands{xs, (i + objectNum)};
        w = GT2View3Hands{xs, (i + objectNum*2)};
        h = GT2View3Hands{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        GT2V3_Ah = [GT2V3_Ah ; [xs, xPos, yPos, x, y, w, h]];
    end

%--------------------------------------------------------------------------

    s = getSize(GT3View1Hands, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = GT3View1Hands{xs, i};
        y = GT3View1Hands{xs, (i + objectNum)};
        w = GT3View1Hands{xs, (i + objectNum*2)};
        h = GT3View1Hands{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        GT3V1_Ah = [GT3V1_Ah ; [xs, xPos, yPos, x, y, w, h]];
    end

    s = getSize(GT3View2Hands, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = GT3View2Hands{xs, i};
        y = GT3View2Hands{xs, (i + objectNum)};
        w = GT3View2Hands{xs, (i + objectNum*2)};
        h = GT3View2Hands{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        GT3V2_Ah = [GT3V2_Ah ; [xs, xPos, yPos, x, y, w, h]];
    end

    s = getSize(GT3View3Hands, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = GT3View3Hands{xs, i};
        y = GT3View3Hands{xs, (i + objectNum)};
        w = GT3View3Hands{xs, (i + objectNum*2)};
        h = GT3View3Hands{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        GT3V3_Ah = [GT3V3_Ah ; [xs, xPos, yPos, x, y, w, h]];
    end

%--------------------------------------------------------------------------


    s = getSize(GT4View1Hands, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = GT4View1Hands{xs, i};
        y = GT4View1Hands{xs, (i + objectNum)};
        w = GT4View1Hands{xs, (i + objectNum*2)};
        h = GT4View1Hands{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        GT4V1_Ah = [GT4V1_Ah ; [xs, xPos, yPos, x, y, w, h]];
    end

    s = getSize(GT4View2Hands, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = GT4View2Hands{xs, i};
        y = GT4View2Hands{xs, (i + objectNum)};
        w = GT4View2Hands{xs, (i + objectNum*2)};
        h = GT4View2Hands{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        GT4V2_Ah = [GT4V2_Ah ; [xs, xPos, yPos, x, y, w, h]];
    end

    s = getSize(GT4View3Hands, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = GT4View3Hands{xs, i};
        y = GT4View3Hands{xs, (i + objectNum)};
        w = GT4View3Hands{xs, (i + objectNum*2)};
        h = GT4View3Hands{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        GT4V3_Ah = [GT4V3_Ah ; [xs, xPos, yPos, x, y, w, h]];
    end

%--------------------------------------------------------------------------

    s = getSize(GT5View1Hands, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = GT5View1Hands{xs, i};
        y = GT5View1Hands{xs, (i + objectNum)};
        w = GT5View1Hands{xs, (i + objectNum*2)};
        h = GT5View1Hands{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        GT5V1_Ah = [GT5V1_Ah ; [xs, xPos, yPos, x, y, w, h]];
    end

    s = getSize(GT5View2Hands, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = GT5View2Hands{xs, i};
        y = GT5View2Hands{xs, (i + objectNum)};
        w = GT5View2Hands{xs, (i + objectNum*2)};
        h = GT5View2Hands{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        GT5V2_Ah = [GT5V2_Ah ; [xs, xPos, yPos, x, y, w, h]];
    end

    s = getSize(GT5View3Hands, xs);
    objectNum = (s/4);
    
    for i = 1:objectNum
        x = GT5View3Hands{xs, i};
        y = GT5View3Hands{xs, (i + objectNum)};
        w = GT5View3Hands{xs, (i + objectNum*2)};
        h = GT5View3Hands{xs, (i + objectNum*3)};
        xPos = x + (w/2);
        yPos = y - (h/2);
        
        GT5V3_Ah = [GT5V3_Ah ; [xs, xPos, yPos, x, y, w, h]];
    end

%--------------------------------------------------------------------------


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

