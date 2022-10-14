clear; clc; close all;
norm = xlsread('\\storage.ncbs.res.in\AB_lab\Current members\Afroze\Papers\RecN_2021\Data\Ori_RecA_30sec_PD\20200203\combined\combined.xls',12);

length = double.empty;
for i = 1
    length(1:size(norm(:,i),1)-1,1)= norm(2:size(norm(:,i),1),i);
end

for i = 2:size(norm,2)
    length((1+size(length,1)):((size(norm(:,i-1),1)-1)+size(length,1)),1)= norm(2:size(norm(:,i),1),i);
end
% length(length==0) = NaN;
% writematrix(length,'SSB_swarmer_data.xlsx','Sheet',6);

%%
clear; clc; close all;
g = xlsread('\\storage.ncbs.res.in\ab_lab\Current members\Afroze\Papers\RecN_2020\figures\20210414\cycle_fraction_position.xlsx',4);
length = double.empty;
for i = 1
    length(1:size(g(:,i),1),1)= g(1:size(g(:,i),1),i);
end

for i = 2:40
    length((1+size(length,1)):(size(g(:,i-1),1)+size(length,1)),1)= g(1:size(g(:,i),1),i);
end

%%
del_position(del_position==0) = NaN;
position(position==0) = NaN;