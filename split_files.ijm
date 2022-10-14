//To split merged images into individual folders
//merge = all merged crops
//split = separate channels for every merge crop
//define i as it will change with data eg. first crop is crop_29 so i=29

parentDir = "//storage.ncbs.res.in/AB_lab/Current members/Afroze/Microscopy/2022/5_may/20220529/AC245_0.3xyl_550nm_100ms_490nm_400ms_008/xy2/crops/"
inputDir = parentDir + "merge/" ;
List1=getFileList(inputDir)

for (i=1; i<=List1.length; i++) 
{
	
	baseName="crop_"+i;
	imgName = "crop_"+i+".tif";
	File.makeDirectory(parentDir+"/split/");
	File.makeDirectory(parentDir+"/split/"+baseName);
    open(inputDir+"crop_"+i+".tif");
	selectWindow(imgName);
	run("Split Channels");
	selectWindow("C1-"+imgName);
	saveAs("Tiff", parentDir +"/split/"+baseName+"/C1-"+baseName+".tif");
	close();
	selectWindow("C2-"+imgName);
	saveAs("Tiff", parentDir +"/split/"+baseName+"/C2-"+baseName+".tif");
	close();
	selectWindow("C3-"+imgName);
	saveAs("Tiff", parentDir +"/split/"+baseName+"/C3-"+baseName+".tif");
	run("Close All");
}
