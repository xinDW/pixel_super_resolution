function X = shiftAndAdd(lr, lr_shift, enhanfactor,psf)
%% shift and add + deconvlution algorithm

lr_num = length(lr);
[lr_height, lr_width] = size(lr{1});

lr_interp = zeros(lr_height * enhanfactor, lr_width * enhanfactor,lr_num);
for i = 1 : lr_num
    lr_temp  = shift(lr{i},-lr_shift(i),-lr_shift(i));
    lr_interp(:,:,i) = imresize(lr_temp,  enhanfactor, 'bicubic');
end 
Z = median(lr_interp,3);

X = deconvlucy(Z,psf);
