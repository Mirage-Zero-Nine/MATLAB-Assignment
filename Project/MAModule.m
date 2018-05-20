% Create Date: 2018-04-21
% Name: Yueyang Zhou

function MAModule(name)
    % Read image
    [f, map] = imread(name);
    [M,N] = size(f);
    thisImage = zeros(size(f));
    for m=1:M
        for n=1:N
            thisImage(m,n) = map(f(m,n)+1,1);
        end
    end
    thisImageFFT = fft2(thisImage);

    % Parameter estimation
    num = 128;
    Eta = zeros(128, num);
    cost = zeros(3, 128);
    Ni = 1:num;
    p = 1; % number of parameter combiantion

    % Traverse every alpha (elongation) and theta (rotation)
    for alpha=1:1:8
        for theta=0:1:7
            AY = gtrans(thisImageFFT,alpha,theta*pi/8);
            Eta(p,:) = MLestimator(N,AY); % Equation (7)
            cost(2,p) = alpha; 
            cost(3,p) = theta*pi/8; 
            for i=2:N
                if(Eta(p,i)~=0) 
                    cost(1,p)=cost(1,p)+(Ni(p)-1)*log(Eta(p,i))+1/2*log(Ni(p)); % Equation (13) 
                end
            end
            p = p+1; % try next parameter combination
        end
    end

    % Find estimated alpha, theta and eta
    [~,C_min] = min(cost(1));
    Alpha=cost(2,C_min); 
    Theta=cost(3,C_min);
    AYY = gtrans(thisImageFFT,Alpha,Theta);
    Eta(1,:) = MLestimator(N,AYY);	% Equation (7) using estimated parameter
    max_eta=max(Eta(1,3:N/2));
    estimated=Eta(1,3:N/2)/max_eta;
    plot(3:N/2,estimated);
    thisTitle = strcat('Estimated\eta_i ', name);
    title(thisTitle);
    s1 = 'Estimated ';
    saveName = strcat(s1,name); 
    print(saveName,'-dpng');
å    
    gaussian = rand(N);
    Gaussian = fft2(gaussian);
    FFT = AYY.*Gaussian;
    result = ifft2(FFT);

    colormap(gray(256));
    imagesc(result);
    pause;

