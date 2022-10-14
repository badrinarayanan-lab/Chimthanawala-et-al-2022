//To crop rois and save in a folder
//keep the composite or image where the rois were made and the roi manager open to run this script
//i = number of ROIs

for (i = 0; i < 2; i++) 
{
directory = "//storage.ncbs.res.in/AB_lab/Current members/Afroze/Microscopy/2022/5_may/20220529/AC245_0.3xyl_550nm_100ms_490nm_400ms_008/xy2/"; 
File.makeDirectory(directory+"crops/");
File.makeDirectory(directory+"crops/merge/");
roiManager("Select", i);
run("Duplicate...", "title=crop_"+i+1+" duplicate");
saveAs("Tiff", directory+"crops/merge/crop_"+i+1+".tif");
close();
}