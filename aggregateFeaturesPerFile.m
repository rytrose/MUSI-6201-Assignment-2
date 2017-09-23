function [aggFeatureMat] = aggregateFeaturesPerFile(featureMat)

%% Aggregates the values in featureValues and returns the mean and standard
% deviation, hence given 2 aggregated features per blocked feature per file.
% Input:
%   featureValues: 1 x numBlocks float array, feature computed using any
%                  of the functions implemented
% Output:
%   fMean:  float number, mean of features
%   fStd:   float number, standard deviation of features

% Write your code below:
aggFeatureMat = zeros(10, 1);
fMat_size = size(featureMat);

i = 1;
while(i < fMat_size(1) + 1)
   mean_i = (i*2) - 1;
   std_i = i * 2;
   aggFeatureMat(mean_i) = mean(featureMat(i, :));
   aggFeatureMat(std_i) = std(featureMat(i, :));
   
   i = i + 1;
end

end