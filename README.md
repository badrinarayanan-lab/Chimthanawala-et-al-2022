# SMC protein RecN drives RecA filament translocation for _in vivo_ homology search
Afroze Chimthanawala, Jyotsana J Parmar, Sujan Kumar, Krishnan S. Iyer, Madan Rao, Anjana Badrinarayanan

NCBS-TIFR, Bangalore

While the molecular repertoire of the homologous recombination pathways is well-studied, the search mechanism that enables recombination between distant homologous regions is poorly understood. Earlier work suggests that the recombinase RecA, an essential component for homology search, forms an elongated filament, nucleating at the break site. How this RecA structure carries out long distance search remains unclear. Here, we follow the dynamics of RecA after induction of a single double-strand break on the Caulobacter chromosome. We find that the RecA-nucleoprotein filament, once formed, rapidly translocates in a directional manner in the cell, undergoing several pole-to-pole traversals, until homology search is complete. Concomitant with translocation, we observe dynamic variation in the length of the filament. Importantly in vivo, the RecA filament alone is incapable of such long distance movement; both translocation and associated length variations are contingent on action of SMC-like protein RecN, via its ATPase cycle. In summary, we have uncovered the three key elements of homology search driven by RecN: mobility of a finite segment of RecA, changes in filament length, and ability to conduct multiple pole-to-pole traversals, which together point to a novel optimal search strategy. 


**Keywords**: homology search, homologous recombination, double-strand break, bacteria, Caulobacter crescentus, RecA, Structural Maintenance of Chromosome proteins, RecN, live-cell imaging 


doi: 

## Processing and analysis of time-lapse data for RecA filaments

- For all RecA time-lapse experiments, fluorescence signal for RecA and MipZ was acquired along with phase contrast images to visualize cell outlines.
- When data was acquired at short time scales (30 or 60 sec intervals), multiple time-lapses over a period of 2h were captured making sure field of view does not over lap, in order to increase the sample size as well as prevent photo-bleaching. 
- For each time-lapse multiple fields of view were captured and labelled as xy1,...,xyn. One field of view contained nearly 150 cells, which were manually observed to identify cells undergoing a single double-strand break.

### Major steps of analysis:
1. Segregate xys and make separate stacks of all 3 channels using 'xy_segregation.ijm'.
2. Manually make ROIs around cells to be analyzed and save using ROI manager in Fiji. We made a ROI of 100x100 pixels, making sure the cell falls within the ROI throughout the time-lapse.
3. Crops were made of these ROIs using 'crop_save_multiple_rois.ijm'. Since these crops contain all channels stacked, they were saved in a folder named 'merge'. 
4. Split the channels using 'split_files.ijm'. Done for two reasons; segmentation and loading only RecA fluorescence data in the MATLAB script by entering the appropriate path.
5. Use the stack of phase images for a given crop for segmentation using 'Oufti, a MATLAB based software'. Parameters used are available as 'caulobacter subpixel'. Only the cell of intereset was manually segmented using the 'Independent frames mode' throughout the time-lapse and the data will be saved as a '.mat' file.
6. Load the segmented data (.mat file) and RecA fluorescence data (.tif file in the 'split' folder) in the MATLAB script 'RecA_filament_dynamics.m' by entering the appropriate path. 
7. The outcome after running this MATLAB script will contain the following:
	a. Kymograph of RecA fluorescence in the entire cell
	b. Kymograph of only the RecA filaments detected by the script
	c. Excel file (.xls) containing: (First RecA localization saved in the 1st column, if multiple localizations are observed, they are saved in subsequent columns)
		i. Normalized position of the RecA filament centroid, Xc (Sheet 1, column A to E)
		ii. Pixel number of centroid position along cell length (Sheet 1, column F to H) 
		iii. Filament length in microns, L (Sheet 2, column A to D)
		iv. Cell length in microns (Sheet 2, column E)
		v. Filament intensity, (Sheet 3)
		vi. Cell intensity (Sheet 4)

### Post-processing of data in excel sheets:
1. To calculate fraction of cell length occupied by the RecA filament (l), use 'normalize_loc_length_by_cell_length.m'.
2. To combine data from all excel files of all individual crops, use 'merge_excel_files.m'.
3. To calculate change in fraction occupied (l) or centroid position (Xc), use 'delta_calculation.m'.
4. In the merged excel file, one column consists of data from one crop/cell. To group data from all crops into one column inorder to plot frequency distributions, use 'combine_all_in_a_column.m'.
5. To align the all cells in a kymograph by the mid-cell position, use 'kympo_center_script.m' just after running 'RecA_filament_dynamics.m'.

### RecA_filament_dynamics.m MATLAB script
Written by Afroze Chimthanawala and Meghana Iyer
This script carries out the following functions:
1. Overlay segmentation from Oufti on the .tif file of RecA fluorescence data.
2. Re-orients the segmented cell in order to align it parallel to the major axis (x-axis).
3. Straightens the cells, as caulobacter cells are crescent shaped.
4. Detects RecA localizations using intensity values above a customizable threshold found using empirical Cumulative Distribution.

