function [featureMat] = extractFeatures(x, blockSize, hopSize, fs)

%% Blocks an audio signal and calls the individual feature extraction functions.
% Once all 5 features are extracted for each block of audio, aggregate the features
% using mean and std across all blocks and return a feature vector that contains
% 10 features (5 features x 2 aggregations)
% Input:
%   x:           N x 1 float vector, input signal
%   blockSize:   int, size of each block
%   hopSize:     int, hop size
%   fs:          int, sampling frequency of x
% Output:
%   featureVect: (10 x numBlocks) float matrix, where numBlocks is 
%                the number of blocks
% Note:
%   1)  numBlocks depends on the length of the audio, zeropadding may be needed

[~,n] = size(x);
if (n>1)
    error('Illegal input signal. Signal has to be downmixed');
end
[m,n] = size(blockSize);
if (m ~= 1 && n ~=1)
    error('Illegal blockSize');
end
[m,n] = size(hopSize);
if (m ~= 1 && n ~=1)
    error('Illegal hopSize');
end
[m,n] = size(fs);
if (m ~= 1 && n ~=1)
    error('Illegal fs');
end
%% Write your code below
blockedAudio = myBlockAudio(x, blockSize, hopSize, fs);
f1 = mySpectralCentroid(blockedAudio, fs);
f2 = myRMS(blockedAudio);
f3 = myZCR(blockedAudio);
f4 = mySpectralCrest(blockedAudio);
f5 = mySpectralFlux(blockedAudio);


featureMat = vertcat(f1, f2, f3, f4, f5);
end