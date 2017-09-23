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
zcr(1) = 0;

i = 2;
while(i < numBlocks + 1)
    
    i = i + 1; 
end

end