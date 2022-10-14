clear; clc; close all;
loc_length = xlsread('\\storage.ncbs.res.in\AB_lab\Current members\Afroze\Microscopy\2022\2_february\KAEQ_5min_PD\combined_PD_KAEQ_5min.xls',2);
cell_length = xlsread('\\storage.ncbs.res.in\AB_lab\Current members\Afroze\Microscopy\2022\2_february\KAEQ_5min_PD\combined_PD_KAEQ_5min.xls',5);

c = double.empty;
for i = 1:size(loc_length,2)
    a = loc_length(1,i);
    [~, b] = find(cell_length(1,:)==a);
    c(1,i) = a;
    for j = 2:size(loc_length(:,i),1)
        c (j,i)= loc_length(j,i)/cell_length(j,b);
    end
end

% writematrix(c,'combined.xls','Sheet',4);
xlswrite('combined_PD_KAEQ_5min',c,6)