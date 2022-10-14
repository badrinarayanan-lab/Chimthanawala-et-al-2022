//'directory' will have the path of the folder containing time-lapse data
//j = number of time-lapses
//i = number of xy/fields of view

for (j=1; j<=5; j++)
{
directory = "//storage.ncbs.res.in/AB_lab/Current members/Afroze/Microscopy/2022/5_may/20220529/AC245_0.3xyl_550nm_100ms_490nm_400ms_00"+j+"/"; 
open(directory);

run("Stack to Images");

	for (i=1; i<=2; i++)
	{
		img_name = "recA";	
	File.makeDirectory(directory+"xy"+i+"/");	
	run("Images to Stack", "name=xy"+i+"_mipz title=xy"+i+"c1 use");
	saveAs("Tiff", directory+"xy"+i+"/xy"+i+"_mipz.tif");
	close();
	run("Images to Stack", "name=xy"+i+"_"+img_name+" title=xy"+i+"c2 use");
	saveAs("Tiff", directory+"xy"+i+"/xy"+i+"_"+img_name+".tif");
	close();
	run("Images to Stack", "name=xy"+i+"_phase title=xy"+i+"c3 use");
	saveAs("Tiff", directory+"xy"+i+"/xy"+i+"_phase.tif");
	close();
	}
}