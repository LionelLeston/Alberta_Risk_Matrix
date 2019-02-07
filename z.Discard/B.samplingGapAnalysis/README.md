# Sampling Gap Analysis, including some data manipulation

1. Using ArcMap: Save attribute table from FORSITE risk matrix geodatabase/shapefile as multiple .csv files, making sure that all records are accounted for. (multiple files used because the file is too large when all records exported in a single file)
2. In R: Combine the files into a single data.frame
3. Using lookup tables, add in columns for abbreviated columns. 
4. Create a ForestID identifier for all polygons exhibiting a specific combination of subregion, stand type, age class, and timber productivity rating. Do this with both abbreviated AND full names: ForID and ForID_long
5. Perform a gap analysis by assigning all Alberta point counts to polygons and ForestIDs based on the point count locations. Also create a separate file of qualitative ranks assigned to each ForestID.