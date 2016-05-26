function I = fastRobustSR(lr, lr_shift, enhanfactor,psf)

lr_num = length(lr);

[lr_height, lr_width] = size(lr{1});

%% Initialization
beta = 0.3; % define the step size for the iterative gradient method
max_iter = 200;
iter = 1;

% BTV
p = 2;
lambda = 0.05;
alpha = 0.6;

% Start with an estimate of our HR image: we use an upsampled version of
% the first LR image as an initial estimate.
%X = imOrigBig;  %iteration begins with a LR image
Z = zeros(size(lr_height * enhanfactor, lr_width * enhanfactor ));  %iteration begins with a zero matrix
X = Z;

E = [];
sharpen = [0 -0.25 0;
    -0.25 2 -0.25;
    0 -0.25 0];

lr_interp = zeros(lr_height * enhanfactor, lr_width * enhanfactor,lr_num);
for i = 1 : lr_num
    lr_temp  = shift(lr{i},-lr_shift(i),-lr_shift(i));
    lr_interp(:,:,i) = imresize(lr_temp,  enhanfactor, 'bicubic');
end 
Z = median(lr_interp,3);
X = Z;

while iter < max_iter

        deblur_term = imfilter(X, psf) - Z;     
        deblur_term = imfilter(deblur_term,sharpen);
    
    %BTV regularization
    regu_term = zeros(lr_height * enhanfactor , lr_width * enhanfactor);
     for l = -p:p
         for m = 0:p
             temp = X - shift(X,l,m);
             regu_term = regu_term + (alpha^(abs(l)+abs(m))) * (temp - shift(temp,-l,-m));
         end
     end
    
    
    % Now that we have the median, we will go in its direction with a step
    % size of lambda
     
    X_pre = X;
    X = X - beta * (deblur_term+lambda* regu_term);  % add regularization (BTV) 
    %X = X - beta * deblur_term;% without regularization 
    
    disp(['--------',num2str(iter),'----------']);
    
   
    delta = norm(X - X_pre)/norm(X);
    disp(['delta = ', num2str(delta)]);
 
    E=[E; iter delta];
    
    if iter>3
        error = E(iter-1,2)-delta;
        disp(['error =  ',num2str(error)]);
        if error < 1e-4
            E
            break
        end
        
    end
    
    iter = iter+1;
    
      
end

disp(['Ended after ' num2str(iter) ' iterations.']);
disp(['Final error is ' num2str(abs(E(iter-3,2)-delta)) ' .']);

I = X;
