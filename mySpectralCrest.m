function [specCrest] = mySpectralCrest(xb)

%% Audio Feature: Spectral Crest
% This function extracts the spectral crest for each block of audio
% in the input matrix xb.
% input: 
%   xb:     (blockSize x numBlocks) float matrix, where numBlocks is 
%           the number of blocks
% output: 
%   specCrest:(1 x numBlocks) float array, the resulting feature value per block

%% Write your code below:

i = 1;
size_xb = size(xb);
numBlocks = size_xb(2);
blockSize = size_xb(1);
specCrest = zeros(1, numBlocks);

while(i < numBlocks + 1)
    window = xb(:,i).*myHann(blockSize);
    mag = abs(fft(window, 2*blockSize));
    mag = mag(1:blockSize);
    specCrest(i) = max(mag)/sum(mag); 
    if(isnan(specCrest(i)))
        specCrest(i) = 0.0;
    end
    i = i + 1;
end

end