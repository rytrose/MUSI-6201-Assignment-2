function rms = myRMS(xb)

%% Audio Feature: Root Mean Square energy
% This function extracts the RMS energy for each block of audio
% in the input matrix xb.
% input: 
%   xb:     (blockSize x numBlocks) float matrix, where numBlocks is 
%           the number of blocks
% output: 
%   maxEnv:(1 x numBlocks) float array, the resulting feature value per block

%% Write your code below:

i = 1;
size_xb = size(xb);
numBlocks = size_xb(2);
blockSize = size_xb(1);
rms = zeros(1, numBlocks);

while(i < numBlocks + 1)
    window = xb(:,i).*myHann(blockSize);
    mag = abs(fft(window, 2*blockSize));
    mag = mag(1:blockSize);
    energy = mag.^2;
    mean = (1/blockSize).*sum(energy);
    rms(i) = sqrt(mean);
    i = i + 1; 
end

end