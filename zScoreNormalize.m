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

%% Write your code below

feature_size = size(featureMatrix);
num_features = feature_size(1);
num_files = feature_size(2);
normFeatureMatrix = zeros(num_features, num_files)
i = 1;

while(i <= num_features)
    feature = featureMatrix(i,:);
    featureMean = mean(feature);
    featureSTDev = std(feature);
    normFeatureMatrix(i,:) = featureMatrix(i,:) - featureMean;
    normFeatureMatrix(i,:) = normFeatureMatrix(i,:) ./ featureSTDev;
    i = i + 1;
end
