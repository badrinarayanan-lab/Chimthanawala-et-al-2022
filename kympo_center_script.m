
centered = NaN(44,10,25);
for i = 1:size(newtemp6,3)
    cell_length_sum = sum(newtemp6(:,:,i),2);
    cell_length = find(cell_length_sum>0,1,'last');
    start_idx = round((size(newtemp6(:,:,i),1)-cell_length)/2);
    stop_idx = start_idx + cell_length-1;
    centered(start_idx:stop_idx,:,i) = newtemp6(1:cell_length,:,i);
end
% centered = flipud(centered);
%%
var10=0;
for var13 = im_data(1):im_data(end) %representing the desired frames
    for x = 1:cols
        if var5 == 1
            imagesc_file(:, x) = centered(:,x, var13);
        else
            imagesc_file(:, ((var10*cols)+x+1)) = centered(:,x, var13); %joining all the aligned cells next to one another
        end
    end
    var10 = var10+1;
end
saved_file = imagesc_file;
var13=im_data(1):im_data(end); 
% figure; imagesc(saved_file); %uncomment to view heatmap


%% Filling in holes with averaged pixel values; #aesthtics
% select section and press -> ctrl+t to uncomment;
% select section and press -> ctrl+r to comment;

for var7 = 2 : size(imagesc_file,2) % goes though each column of the concatenated image file
    temp8 = imagesc_file(:,var7);
    [row_idx, ~] = find(temp8);

    for var8 = min(row_idx):max(row_idx)
        if imagesc_file(var8, var7) == 0
            up = imagesc_file(var8-1, var7);
            down = imagesc_file(var8+1, var7);
            right = imagesc_file(var8, var7+1);
            left = imagesc_file(var8, var7-1);
            A = [up, down, right, left]; % neighboring pixel values
            imagesc_file(var8, var7) = ceil(mean(nonzeros(A))); % considers only the pixels that have values
        end
    end
end

figure; 
imagesc(imagesc_file);
set(gca,'XTick',[]) % Remove the ticks in the x axis!
set(gca,'YTick',[]) % Remove the ticks in the y axis
set(gca,'Position',[0 0 1 1]) % Make the axes occupy the hole figure
% saveas(gcf,['kymo_N_crop_',num2str(c)],'fig')
% saveas(gcf,'kymo_crop_bleach_correction.fig')