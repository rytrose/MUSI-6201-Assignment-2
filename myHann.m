function [ w ] = myHann( block_size )

w = zeros(block_size, 1);
for n = 1:block_size
    w(n) = (1 - cos((2 * pi * (n - 1))/(block_size - 1))) * .5;
end
end

