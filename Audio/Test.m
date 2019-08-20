fname = 'Reconstructed.wav';
[x,Fs] = audioread(fname); % Read TIMIT data file into a vector x
plot(x);
title('x');
pause;
 player = audioplayer(x, Fs);
 play(player);
 pause;
