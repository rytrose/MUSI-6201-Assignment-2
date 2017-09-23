function [zcr] = myZCR(xb)

%% Audio Feature: Zero-Crossing Rate
% This function extracts the zero-crossing rate for each block of audio
% in the input matrix xb.
% input: 
%   xb:     (blockSize x numBlocks) float matrix, where numBlocks is 
%           the number of blocks
% output: 
%   specCrest:(1 x numBlocks) float array, the resulting feature value per block

%% Write your code below:

size_xb = size(xb);
numBlocks = size_xb(2);
blockSize = size_xb(1);
zcr = zeros(1, numBlocks);

i = 1;
while(i < numBlocks + 1)
    block = xb(:,i);
    zc = zeros(blockSize, 1);
    zc(1) = 0;
    j = 2;
    while(j < blockSize + 1)
        zc(j) = abs(sign(block(j)) - sign(block(j - 1)));
        j = j + 1;
    end
    summed = sum(zc);
    
    zcr(i) = (1/(2*blockSize))*summed;
    i = i + 1; 
end

end