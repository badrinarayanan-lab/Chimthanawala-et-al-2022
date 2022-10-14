cycle_1min_delP = xlsread('\\storage.ncbs.res.in\AB_lab\Current members\Afroze\Thesis\chapter_1\20220601\cycle_info_20220601.xlsx',5);

% for i = 1:size(cycle_1min_delP,2)
%     for j = 2: size(cycle_1min_delP(:,i),1)
%         k(j,i)=cycle_1min_delP(j,i)/cycle_1min_delP(2,i);
%     end
% end

for i = 1:size(cycle_1min_delP,2)
    for j = 2: size(cycle_1min_delP(:,i),1)
        g(j,i)=cycle_1min_delP(j,i)-cycle_1min_delP((j-1),i);
    end
end
 
% for i = 1:size(cycle_1min_delP,2)
%     for j = 1: size(cycle_1min_delP(:,i),1)
%         h(j,i)=cycle_1min_delP(j,i)-cycle_1min_delP(1,i);
%     end
% end
% 

% for i = 1:size(cycle_1min_delP,2)
%     if cycle_1min_delP(2,i)>0.5
%         cycle_1min_delP(:,i) = (1-cycle_1min_delP(:,i));
%     end
% end
