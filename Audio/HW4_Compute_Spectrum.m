% Name: Yueyang Zhou
% Date: 2018-11-20
% Computer Spectrum

function s = HW4_Compute_Spectrum(a,G)
Nf = 1000;
p = length(a);
s = zeros(Nf,1);
for n=1:Nf
    f = (n-1)/Nf;
    AA = 0;
    for m=1:p
        z = a(m)*exp(-1i*pi*f*(m-1));
        AA = (AA+z);
    end
    s(n) = G^2/(abs(AA))^2;
end