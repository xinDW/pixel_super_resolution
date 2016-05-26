function I = rs(lr, lr_shift, enhanfactor,psf)
%% robust super resolution algorithm implementing fomula [22]
%"Fast and Robust Multiframe Super Resolution"  Sina Farsiu, M. Dirk Robinson, Student Member, IEEE, Michael Elad, and Peyman Milanfar, Senior Member, IEEE

length(lr)
[lr_height, lr_width] = size(lr{1});

for i = 1 : length(lr)
    lr{i} = double(lr{i});
end

%% Initialization
beta = 0.2; % define the step size for the iterative gradient method
max_iter = 200;
iter = 1;

% BTV
p = 2;
lambda = 0.05;
alpha = 0.6;

% Start with an estimate of our HR image: we use an upsampled version of
% the first LR image as an initial estimate.
%X = imOrigBig;  %iteration begins with a LR image
X = zeros(lr_height* enhanfactor , lr_width * enhanfactor);  %iteration begins with a zero matrix
X_prev = X;
E = [];
sharpen = [0 -0.25 0;
    -0.25 2 -0.25;
    0 -0.25 0];
gamma = zeros(lr_height * enhanfactor , lr_width * enhanfactor);

%% Separable Convolution
[flag_is_separable, psf_col, psf_row] = isfilterseparable(psf);

if flag_is_separable == 1
    disp('convolution kernel separable');
end

pSize = paddedSize(size(X),  size(psf));
% H = fft2(psf, pSize(1), pSize(2));

tic;
while iter < max_iter
    
    % Compute the gradient of the total squared error of reassembling the HR
    % image:
    
    for i=1:length(lr)
        temp = shift(X, (enhanfactor * lr_shift(i,2)), (enhanfactor * lr_shift(i,1)));
       %% Spatial Separable Filter 
       %         if flag_is_separable == 1
       %             temp = imfilter(temp,psf_col);
       %             temp = imfilter(temp,psf_row);
       %         else
       %             temp = imfilter(temp, psf);
       %         end
       %% Spatial Domian Filter
        % temp = conv2(temp,psf,'same');
        %temp = imfilter(temp, psf);
        %temp = filter2(psf,temp);
        
       %% Frequency Domain Filter
%         T = fft2(temp,pSize(1),pSize(2));
%         F = T .* H;
%         temp = ifft2(F);
%         temp = temp(1:size(X,1), 1:size(X,2));

        temp = imfilter(temp, psf);
        temp = temp(1:enhanfactor:end, 1:enhanfactor:end);
        %temp = downsample(temp,factor)';
        %temp = downsample(temp,factor)';
        temp = temp - lr{i};
        temp = imresize(temp, enhanfactor, 'bicubic');
        temp = imfilter(temp,sharpen);
        %temp = filter2(sharpen,temp);
        G(:,:,i) = shift(temp, -(enhanfactor * lr_shift(i,2)), -(enhanfactor * lr_shift(i,1)));
    end
    % Take the median of G, element by element
    M = median(G, 3);
    %M = mean(G,3);
    
   %% BTV regularization
    %      for l = -p:p
    %          for m = 0:p
    %             reg_temp = X - shift(X,l,m);
    %             gamma = gamma + (alpha^(abs(l)+abs(m))) * (reg_temp - shift(reg_temp,-l,-m));
    %         end
    %     end
    
    
    % Now that we have the median, we will go in its direction with a step
    % size of beta
    X = X - beta * (M+lambda* gamma); % add regularization (BTV)
    %X = X - beta * M;% without regularization
    
    disp(['--------',num2str(iter),'----------']);
    
    
    delta = norm(X-X_prev)/norm(X);
    disp(['delta = ', num2str(delta)]);
    
    E=[E; iter delta];
    
    if iter>3
        error = E(iter-1,2)-delta;
        disp(['error =  ',num2str(error)]);
        if error < 1e-4
            break
        end
    end
    X_prev = X;
    iter = iter+1;
end

disp(['Ended after ' num2str(iter) ' iterations.']);
disp(['Final error is ' num2str(abs(E(iter-3,2)-delta)) ' .']);

I = X;
toc;
