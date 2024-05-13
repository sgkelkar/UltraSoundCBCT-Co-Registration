%This is an example image

idx = find(strcmp({tifFiles.name}, 'bone_stitch_xy0089.tif'));

if ~isempty(idx)
filenameImA = fullfile(folder, tifFiles(idx).name);
I2 = imread(filenameImA);

% Display the image
figure(1)
imshow(I2) %display the original image
title('Original Image')



% Test 1 - Apply diffusion filter to reduce noise and enhance edges
J = imdiffusefilt(I2);
figure(2)
imshow(J)
imshowpair(I2,J,'montage');
title('Diffusion filter')


% equalization
J = histeq(I2);
figure
imshowpair(I2,J,'montage');
title('Histogrm Ecualization')


% adaptive equalizaion - to enahnce local contrast
figure
J = adapthisteq(I2,'clipLimit',0.02,'Distribution','rayleigh');
imshowpair(I2,J,'montage');
title('Adaptiv equalization with rayleigh distribution, alpha =.02')


%different levels of Adaptive histogram equalization

figure
J = adapthisteq(I2,'clipLimit',0.1,'Distribution','rayleigh');
imshowpair(I2,J,'montage');
title('Adaptiv equalization with rayleigh distribution alpha =.1')

figure
J = adapthisteq(I2,'clipLimit',0.2,'Distribution','rayleigh');
imshowpair(I2,J,'montage');
title('Adaptiv equalization with rayleigh distribution alpha =.22')

figure
J = adapthisteq(I2,'clipLimit',0.5,'Distribution','rayleigh');
imshowpair(I2,J,'montage');
title('Adaptiv equalization with rayleigh distribution alpha =.5')

figure
J = adapthisteq(I2,'clipLimit',0.02,'Distribution','uniform');
imshowpair(I2,J,'montage');
title('Adaptiv equalization with uniform distribution')

figure
J = adapthisteq(I2,'clipLimit',0.02,'Distribution','exponential');
imshowpair(I2,J,'montage');
title('Adaptiv equalization with exponential distribution alpha =.02')

figure
J = adapthisteq(I2,'clipLimit',0.1,'Distribution','exponential');
imshowpair(I2,J,'montage');
title('Adaptiv equalization with exponential distribution alpha =.1')

figure
J = adapthisteq(I2,'clipLimit',0.2,'Distribution','exponential');
imshowpair(I2,J,'montage');
title('Adaptiv equalization with exponential distribution alpha =.2')




% Anosotropic difussion filter - for edge preservation
nB = ssim(I2,J);
disp(['The SSIM value using default anisotropic diffusion is ',num2str(nB),'.'])

[gradThresh,numIter] = imdiffuseest(I2,'ConductionMethod','quadratic');
C = imdiffusefilt(I2,'ConductionMethod','quadratic', ...
    'GradientThreshold',gradThresh,'NumberOfIterations',numIter);
imshow(C)
title('Anisotropic Diffusion with Estimated Parameters')
nC = ssim(I2,C);
disp(['The SSIM value using quadratic anisotropic diffusion is ',num2str(nC),'.'])
figure
imshowpair(I2,C,'montage');
title('Anisotropic Diffusion with Estimated Parameters')


% Gamma correction
J = imadjust(C,[],[],0.5);
figure
imshowpair(C,J,'montage');
title('Gamma correction with parameter = 0.1')


% Gamma correction
J = imadjust(I2,[],[],0.5);
figure
imshowpair(I2,J,'montage');
title('Gamma correction with parameter = 0.5')



% Gamma correction
J = imadjust(I2,[],[],0.5);
figure
imshowpair(I2,J,'montage');
title('Gamma correction with parameter = 0.5')



% Gamma correction
J = imadjust(I2,[],[],0.5);
figure
imshowpair(I2,J,'montage');
title('Gamma correction with parameter = 0.5')

J = imadjust(I2,[],[],0.75);
figure
imshowpair(I2,J,'montage');
title('Gamma correction with parameter = 0.75')

J = imadjust(I2,[],[],1.25);
figure
imshowpair(I2,J,'montage');
title('Gamma correction with parameter = 1.25')

%Edge detection
BW1 = edge(I2,'sobel');
BW2 = edge(I2,'canny');
imshowpair(BW1,BW2,'montage');
title('Edge dtection  SOBEL + CANNY')


% Special pipeline

%  GAMMA CORRECCTION OF 1.25
J = imadjust(I2,[],[],1.25);

% aNISOTROPIC FILTER
[gradThresh,numIter] = imdiffuseest(I2,'ConductionMethod','quadratic');
C2 = imdiffusefilt(I2,'ConductionMethod','quadratic', ...
    'GradientThreshold',gradThresh,'NumberOfIterations',numIter);


% wIENER FILTER
K = wiener2(C2,[5 5]);



end
