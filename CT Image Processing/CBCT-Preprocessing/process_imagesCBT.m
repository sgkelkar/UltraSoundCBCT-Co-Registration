% Define the folder containing the .tif files
folder = '/Users/snehakelkar/Downloads/Tiff Stack/';

% Get a list of all .tif files in the folder
filePattern = fullfile(folder, '*.tif');
tifFiles = dir(filePattern);

% Preallocate a cell array to store the images
numFiles = length(tifFiles);
stack = cell(1, numFiles);

% Loop through each .tif file and read it into the stack
for i = 1:numFiles
    filename = fullfile(folder, tifFiles(i).name);
    stack{i} = imread(filename);
    
    % Process the image using pipelinesgkel
    I2 = stack{i}; % Assuming each image is stored in a variable I2
    pipeline_skel
    % Save the processed image
    filenameOut = fullfile(folder, ['outputRGB_', num2str(i-1), '.tif']); % Assumes k starts from 0
    imwrite(labelsRGB, filenameOut);
end
