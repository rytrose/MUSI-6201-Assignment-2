function [normFeatureMatrix] = zscoreNormalize(featureMatrix)

%% Performs z-score normalization over the input featureMatrix
%
% Inputs:
%   featureMatrix:  f x N float matrix, where f is the number of features (10 in this case)
%                   and N is the number of audio files in the directory.
%
% Outputs:
%   normFeatureMatrix:  f x N float matrix, where f is the number of features (10 in this case)
%                   and N is the number of audio files in the directory.

% Write your code below