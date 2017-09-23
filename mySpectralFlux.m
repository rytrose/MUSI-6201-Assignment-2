function [specFlux] = mySpectralFlux(xb)

%% Audio Feature: Spectral Flux
% This function extracts the spectral flux for each block of audio
% in the input matrix xb.
% input: 
%   xb:     (blockSize x numBlocks) float matrix, where numBlocks is 
%           the number of blocks
% output: 
%   specFlux:(1 x numBlocks) float array, the resulting feature value per block

%% Write your code below:

i = 1;
size_xb = size(xb);
numBlocks = size_xb(2);
blockSize = size_xb(1);
specFlux = zeros(1, numBlocks);

while(i < numBlocks + 1)
    window = xb(:,i).*myHann(blockSize);
    mag = abs(fft(window, 2*blockSize));
    mag = mag(1:blockSize);
    
    delta = zeros(blockSize, 1);
    delta(1) = 0;
    j = 2;
    while(j < blockSize + 1)
        delta(j) = mag(j) - mag(j - 1); 
        j = j + 1;
    end
    specFlux(i) = sqrt(sum(delta.^2))/blockSize; 
    if(isnan(specFlux(i)))
        specFlux(i) = 0.0;
    end
    i = i + 1;
end

end