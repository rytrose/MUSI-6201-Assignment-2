function [featureMatrix] = getMetaData(path, blockSize, hopSize)

%% Iterates over all files in a folder, computes the aggregated features
% for each file and returns a feature matrix for all files.
%
% Inputs:
%   path:       string, path to directory that contains only audio files, for which
%               features are to be extracted
%   blockSize:  integer, blockSize to be used for blocking of audio files
%   hopSize:    integet, hopSize to be used for blocking of audio files
%
% Outputs:
%   featureMatrix:  f x N float matrix, where f is the number of features (10 in this case)
%                   and N is the number of audio files in the directory.

% Write your code below
files = dir(path);
numFiles = length(files) - 2
featureMatrix = zeros(10, numFiles);

i = 1;
while(i < length(files) + 1)
    file = files(i);
    if(~strcmp(file.name, '.') && ~strcmp(file.name, '..'))
       [x, fs] = audioread(strcat(file.folder, '\' , file.name));
       fMat = extractFeatures(x, blockSize, hopSize, fs);
       fMat = aggregateFeaturesPerFile(fMat);
       featureMatrix(:, i - 2) = fMat;
    end
    
    i = i + 1;
end



end