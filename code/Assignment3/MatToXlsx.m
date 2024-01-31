% Used to convert a ground truth .Mat file to an excel file

% gets the source video
labeledData = gtTop.ROILabelData.video_V3TopView;
data = table();


% gets the bboxes data from every frame
for i = 1:height(labeledData)
    frameInfo = labeledData(i, :);
    frameInfoTable = timetable2table(frameInfo);
    data = [data; frameInfoTable];
end

% create excel file
writetable(data, 'V3_Top_GT_F.xlsx');
