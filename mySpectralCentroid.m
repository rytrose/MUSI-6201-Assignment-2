function [specCentroid] = mySpectralCentroid(xb, fs)

%% Audio Feature: Spectral Centroid
% This function extracts the spectral centroid for each block of audio
% in the input matrix xb.
% input: 
%   xb:     (blockSize x numBlocks) float matrix, where numBlocks is 
%           the number of blocks
% output: 
%   specCentroid:(1 x numBlocks) float array, the resulting feature value per block

%% Write your code below:

i = 1;
size_xb = size(xb);
numBlocks = size_xb(2);
blockSize = size_xb(1);
frequencies = ((fs/(2*blockSize))*[1:blockSize])';
specCentroid = zeros(1, numBlocks);

while(i < numBlocks)
    window = xb(:,i).*myHann(blockSize);
    mag = abs(fft(window, 2*blockSize));
    mag = mag(1:blockSize);
    specCentroid(i) = sum(frequencies.*mag)/sum(mag);
    if(ISNAN(specCentroid(i)))
        specCentroid(i) = 0.0;
    end
end

end