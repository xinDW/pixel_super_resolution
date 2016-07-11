function main(ccd_size,mag_factor,NA,step,scan_angle,lr,enhan_factor,algo,extra_info)
%% function that runs in the callback of Button Run ,which does the parameter computing works and then calls robust SR function 
%ccd_size,
%mag_factor,
%lr_num,
%enhan_factor,
%step -- stepsize per shoot while taking sample images
%scan_angle
% algo : 1 -- robust sr implementing formula [22]
%          2 -- fast robust sr implementing formula [24]
% extra_info -- extra string that users may want to add in hr image file name

lr_num = length(lr);
for i = 1 : lr_num
    lr{i} = lr{i}(:,:,1);
    lr{i} = double(lr{i});
end

lrPixelSize = ccd_size / mag_factor;
scan_angle = deg2rad(scan_angle);

% lr shift in micron
x_step = cos(scan_angle) * step;
y_step = sin(scan_angle) * step;

% lr shift in pixel
xStepInPixel = x_step/lrPixelSize;
yStepInPixel = y_step/lrPixelSize;

x_shift = [0:xStepInPixel:(lr_num* xStepInPixel)]';
y_shift = [0:yStepInPixel:(lr_num* yStepInPixel)]';

lr_shift = [x_shift,y_shift];

%generator psf
[psf_lr,psf_hr] = generatePSF(ccd_size,mag_factor,NA,enhan_factor);

switch algo 
    case 1
        algoname = 'rsr';
        hr = rs(lr,lr_shift,enhan_factor,psf_hr);
    case 2
        algoname = 'fastsr';
        hr = fastRobustSR(lr, lr_shift, enhan_factor,psf_hr);  
    case 3
        algoname = 'shift and add + deconvlution'
        hr = shiftAndAdd(lr, lr_shift, enhan_factor,psf_hr);
end
hr = hr / max(hr(:)) * 65535 ;
hr = uint16(hr);


format shortg
time = clock;
save_path = pwd;
save_path = [save_path '\HR' ];
hr_name = [save_path '\hr_' algoname  '_' num2str(time(1)) '_' num2str(time(2)) '_' num2str(time(3))  extra_info '.tif'  ];

imwrite(hr,hr_name);
consoleInfo = ['image saved as : ' hr_name];
disp(consoleInfo);
