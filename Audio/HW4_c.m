% part 1
fname = 'LDC93S1.wav';
[x,Fs] = audioread(fname); % Read TIMIT data file into a vector x
plot(x);
title('x');
pause;
% player = audioplayer(x, Fs);
% play(player);
% pause;

%part 2
a = uencode(x,16);
b = udecode(a,16);
plot(b);
title('udecode16');
pause;
t=1:46797;
compressed = compand(b,255,max(b),'mu/compressor'); 
plot(compressed);
title('compressed');
pause;
y=udecode(uencode(compressed,8),8);
plot(t,y);
title('y');
pause;
filename = '8bits.wav';
audiowrite(filename,y,Fs);

%the code of part 3 is in adpcm_decoder and adpcm_encoder
%part 4
z = adpcm_encoder_ori(y);
plot(z);
title('adpcm encoder ori');
pause;
%part 5
y1= adpcm_decoder_ori(z);
plot(y1);
title('y1');
%part 6 7
x1 = compand(y1,255,max(y1),'mu/expander');
plot(x1);
title('x1');
pause;
% player = audioplayer(x1, Fs);
% play(player);
filename = 'reconstructive.wav';
audiowrite(filename,y,Fs);