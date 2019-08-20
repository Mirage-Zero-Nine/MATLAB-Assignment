% Name: Yueyang Zhou
% Date: 2018-11-20
% Final Project

function Main
% Main - Description
% Main part of this function

% Part 1: Read TIMIT data file into a vector x

fname = 'LDC93S1.wav';

% Read TIMIT data file into a vector x
[x,Fs] = audioread(fname); 
x
pause;
% Plot vector x
% plot(x);
% title('Origin Audio Vector');
% pause;

% Play audio x
% player = audioplayer(x, Fs);
% play(player);
% pause;

% Part 2: Apply u-Law compression to the data x that is quantized in 16 bits, 
% and convert to an 8-bit data y.

a = uencode(x,16);
pause;
y = udecode(a,16)
% plot(b);
pause;
% title('udecode16');
% pause;
% t=1:46797;
% compressed = compand(b,255,max(b),'mu/compressor'); 
% plot(compressed);
% title('compressed');
% pause;
% y=udecode(uencode(compressed,8),8);
% plot(t,y);
% title('y');
% pause;

% Part 3: Implement the IMA ADPCM algorithm.

% Part 4: Apply the ADPCM Encoder to compressed data y, and obtain encoded data z.

% Part 5: Apply the ADPCM Decoder to the encoded data z, and obtain decoded data y'.

% Part 6: Apply u-Law expansion to the decoded data y', and obtain the reconstructed speech x'.