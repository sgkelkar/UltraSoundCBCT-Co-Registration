fid = fopen('13DCBCTImageSet.nrrd', 'r'); % Open the file in read mode
data = fscanf(fid, '%f'); % Read the data
fclose(fid); % Close the file