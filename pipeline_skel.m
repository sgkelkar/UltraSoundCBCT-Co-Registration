% ADAPTIVE EQUALIZATION
%J2 = adapthisteq(I2,'clipLimit',0.02,'Distribution','rayleigh');
J2 = histeq(I2);
J2 = wiener2(J2,[5 5]);


% ANISOTROPIC FILTER
[gradThresh,numIter] = imdiffuseest(J2,'ConductionMethod','quadratic');
C2 = imdiffusefilt(J2,'ConductionMethod','quadratic', ...
    'GradientThreshold',gradThresh,'NumberOfIterations',numIter);


% WIENER FILTER
K = wiener2(C2,[5 5]);

% NULTITHRESHOLD IN 3 LEVELS
thresh = multithresh(K,2);
labels = imquantize(K,thresh);
L1=labels==1;
L2=labels==2;
L3=labels==3;


% SOME MORPHOLOGICAL IMPROVEMENT, LIKE OPENING AND SOME SMALLOBJECTS
% REMOVAL

[BW_out,properties] = filterRegionsSize(L3);

se = strel('line',3,0);
BW_out=imopen(BW_out,se);
Itest=imcomplement(BW_out);
[BW_outt,properties] = filterRegionsInverted(Itest);

BW_outt=imopen(BW_outt,se);
BW_outt=imcomplement(BW_outt);
imshow(BW_outt)

XF1 = uint8(imcomplement(BW_outt));


[BW_out2,properties] = filterRegionsLLena(L2);
BW_out2C=uint8(BW_out2).*XF1;


FF2=uint8(BW_out)*3+uint8(BW_out2C).*2;
msk=uint8(imcomplement(logical(FF2)));


[BW_out3,properties] = filterRegionsExt(L1);
msk2=uint8(imcomplement(BW_out3));


Fim=uint8(BW_out3).*msk+FF2;
Iz=uint8(Fim==0);
Fim=Fim+Iz*2;


% CONVERT IMAGE TO COLOR
figure(5)
labelsRGB = label2rgb(Fim);
Igray=rgb2gray(labelsRGB);
imshow(labelsRGB)



% DETECT EDGES
BW1 = edge(Igray,'sobel');
BW2 = edge(Igray,'canny');
imshowpair(BW1,BW2,'montage');
title('Edge dtection  SOBEL + CANNY')


