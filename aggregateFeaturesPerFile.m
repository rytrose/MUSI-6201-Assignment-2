function [fMean, fStd] = aggregateFeaturesPerFile(featureValues)

%% Aggregates the values in featureValues and returns the mean and standard
% deviation, hence given 2 aggregated features per blocked feature per file.
% Input:
%   featureValues: 1 x numBlocks float array, feature computed using any
%                  of the functions implemented
% Output:
%   fMean:  float number, mean of features
%   fStd:   float number, standard deviation of features

% Write your code below: