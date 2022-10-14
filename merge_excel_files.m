clear; clc; close all;

quadrant_occupancy = double.empty;
localization_length = double.empty;
cell_length = double.empty;
localization_intenisty = double.empty;
cell_intenisty = double.empty;
main_folder = '\\storage.ncbs.res.in\AB_lab\Current members\Afroze\Microscopy\2022\2_february\KAEQ_5min_PD';

for i = 1:50
    if exist([main_folder,'\quadrant_occupancy_crop_', num2str(i),'.xls'], 'file') == 0
  % File does not exist
  % Skip to bottom of loop and continue with the loop
      continue;
    else
    data_qo=xlsread([main_folder,'\quadrant_occupancy_crop_', num2str(i),'.xls'],2,'E:E');
    cell_length(1:size(data_qo,1),i)=data_qo;
    end
end

% for i = 73
%     data = xlsread([main_folder,'\quadrant_occupancy_crop_', num2str(i),'.xls'],1,'A:C');
%     quadrant_occupancy(1,1:size(data,2))=i;
%     quadrant_occupancy(2:1+size(data,1),1:size(data,2)) = data;
% end

% for i = 73
%     data = xlsread([main_folder,'\quadrant_occupancy_crop_', num2str(i),'.xls'],2,'A:C');
%     localization_length(1,1:size(data,2))=i;
%     localization_length(2:1+size(data,1),1:size(data,2)) = data;
% end

for i = 1:50
    if exist([main_folder,'\quadrant_occupancy_crop_', num2str(i),'.xls'], 'file') == 0
%   File does not exist
%   Skip to bottom of loop and continue with the loop
      continue;
    else
    data_qo = xlsread([main_folder,'\quadrant_occupancy_crop_', num2str(i),'.xls'],1,'A:C');
    quadrant_occupancy(1,(1+size(quadrant_occupancy,2)):(size(quadrant_occupancy,2)+size(data_qo,2)))=i;
    quadrant_occupancy(2:(1+size(data_qo,1)),(1+size(quadrant_occupancy,2)-size(data_qo,2)):size(quadrant_occupancy,2)) = data_qo;
    data_length = xlsread([main_folder,'\quadrant_occupancy_crop_', num2str(i),'.xls'],2,'A:C');
    localization_length(1,(1+size(localization_length,2)):(size(localization_length,2)+size(data_length,2)))=i;
    localization_length(2:(1+size(data_length,1)),(1+size(localization_length,2)-size(data_length,2)):size(localization_length,2)) = data_length;
    data_intensity = xlsread([main_folder,'\quadrant_occupancy_crop_', num2str(i),'.xls'],3,'A:C');
    localization_intenisty(1,(1+size(localization_intenisty,2)):(size(localization_intenisty,2)+size(data_intensity,2)))=i;
    localization_intenisty(2:(1+size(data_intensity,1)),(1+size(localization_intenisty,2)-size(data_intensity,2)):size(localization_intenisty,2)) = data_intensity;
    data_cell_intensity = xlsread([main_folder,'\quadrant_occupancy_crop_', num2str(i),'.xls'],4,'A:C');
    cell_intenisty(1,(1+size(cell_intenisty,2)):(size(cell_intenisty,2)+size(data_cell_intensity,2)))=i;
    cell_intenisty(2:(1+size(data_cell_intensity,1)),(1+size(cell_intenisty,2)-size(data_cell_intensity,2)):size(cell_intenisty,2)) = data_cell_intensity;
   end
end

% for i = 2:50
%     data = xlsread([main_folder,'\quadrant_occupancy_crop_', num2str(i),'.xls'],2,'A:C');
%     localization_length(1,(1+size(localization_length,2)):(size(localization_length,2)+size(data,2)))=i;
%     localization_length(2:(1+size(data,1)),(1+size(localization_length,2)-size(data,2)):size(localization_length,2)) = data;
% end

writematrix(quadrant_occupancy,'combined_PD_KAEQ_5min.xls','Sheet',1);
writematrix(localization_length,'combined_PD_KAEQ_5min.xls','Sheet',2);
writematrix(localization_intenisty,'combined_PD_KAEQ_5min.xls','Sheet',3);
writematrix(cell_intenisty,'combined_PD_KAEQ_5min.xls','Sheet',4);
writematrix(cell_length,'combined_PD_KAEQ_5min.xls','Sheet',5);