function [psf_lr,psf_hr] = generatePSF(ccdSize,magFactor,NA,rsEnhanFactor)

%% Generate a 2D point spread function for a image samping system
% ccdSize - size of CCD ,in micron (6.5 um ,etc.)
% magFactor - magnification factor of microscope objective lens
% NA - numerical aperture of microscope  objective lens

% rsEnhancefactor - enhancement factor  in robust SR algorithm,which is
% used to compute a psf for HR image(i.e.,X).

%Note that in RobustSR iteration ,X is shifted ,blured,and downsampled.When
%blur operation is ahead of downsampling,the psf used in imfliter() function should be psf_hr. 

lrPixelSize = ccdSize / magFactor;
optResolution = (0.61*0.55/NA)/lrPixelSize  % optical resolution of microscope system
sampResolution = 2 ;  % by Nyquist sampling theorem
 
% if sampResolution > optResolution %  underSampling 
%     FWHM = sampResolution;
% else
%     FWHM = optResolution;  % overSampling
%     FWHM = round(FWHM);
% end

FWHM = optResolution;
%psfSize =  FWHM * 3;% psf image size;
psfSize = FWHM;
psfSize  = round(psfSize);
sigma = FWHM * 1.7/4;

psf_lr = fspecial('gaussian',psfSize,sigma);
psf_hr = fspecial('gaussian',psfSize * rsEnhanFactor, sigma*rsEnhanFactor);

temp_lr_save = mat2gray(psf_lr);
imwrite(temp_lr_save,['psf_lr_' 'ccd_' num2str(ccdSize) 'mag_' num2str(magFactor) '.tif']);
temp_hr_save = mat2gray(psf_hr);
imwrite(temp_hr_save,['psf_hr_' 'ccd_' num2str(ccdSize) 'mag_' num2str(magFactor) '.tif']);

% Normalization
psf_lr = psf_lr/(sum(psf_lr(:)));
psf_hr = psf_hr/(sum(psf_hr(:)));
