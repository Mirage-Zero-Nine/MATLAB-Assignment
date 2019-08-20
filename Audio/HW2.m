% Homework 2
% Read the wave file and process it.
% Yueyang Zhou
% 2018-09-25

% 1. Read wav file into a vertor x
function HW2

fname = 'LDC93S1.wav';
x = audioread(fname);
N = length(x);

% Play the vector x
sound(x,16000);

% Plot this vector
plot(x)
pause;

M = 5;
Length = length(x);
segment = int32(Length/M);

for i = 1:M
    start = (i-1)*segment;
    endIndex =i*segment;
    xi = x(start+1:endIndex);
    plot(xi);
    pause;
end

% Divide the speech file into 20ms segments (320 samples each)
% Compute periodogram of each segment using the program you wrote in Homework 1. 
% Then compute spectrogram by constructing an image made of set of periodogram. 
% Display the negative image in log-scale.

M = int64(N/320);
B = zeros(320,M);

% 2D array
for i=1:M
%     start index
    istart = int64((i-1)*N/M+1);
    b=x(istart:istart+319);
%     fft
    b = fft(b);
    b = abs(b);
    B(:,i)=-log(b+1);
    
end
B
imagesc(B);
colormap(gray);
pause;


