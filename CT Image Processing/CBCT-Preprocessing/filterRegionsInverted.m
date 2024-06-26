function [BW_out,properties] = filterRegionsInverted(BW_in)
%filterRegions Filter BW image using auto-generated code from imageRegionAnalyzer app.

% Auto-generated by imageRegionAnalyzer app on 08-February-2024
%---------------------------------------------------------

BW_out = bwareafilt(BW_in,1000);

% Filter image based on image properties.
BW_out = bwpropfilt(BW_out,'Area',[200 + eps(200), Inf]);

% Get properties.
properties = regionprops(BW_out, {'Area', 'Eccentricity', 'EquivDiameter', 'EulerNumber', 'MajorAxisLength', 'MinorAxisLength', 'Orientation', 'Perimeter'});