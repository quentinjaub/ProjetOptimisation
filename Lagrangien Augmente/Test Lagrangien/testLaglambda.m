%% Test Lagrangien Augmente sur l0
%flag,  x0, l0, f, c, grad_f, deriv_c, hess_f, d2c, kmax
clear all
close all
format long

[f, grad_f, hess_f] = f2();
 x0=[sqrt(3)/2;sqrt(3)/2];
nb_max=50;
nbmax_sp=50;
l0=1;
delta_0=1;
delta_max=10;

global mu0 nt0 a b;
a=0.1;
b=0.9;
mu0=100;
nt0=0.1258925;
n=50;
tho=6;
[ c, deriv_c, d2c ] = contrainte(2);
tab=linspace(0,10,n);
tab2=zeros(n,1);

for i = 1:n
    [ xsol , ~, ~, k, ~ , ~] = Lagrangien(2,x0, tab(i), f, c, grad_f, deriv_c, hess_f, d2c, nb_max,delta_0, delta_max, nbmax_sp,tho );
    tab2(i) = k;
    if (mod(i,5)==0)
      xsol
    end
end;



plot(tab,tab2)
title('Nb iterations = f_2(l0) pour x0=[sqrt(3)/2;sqrt(3)/2] (Newton)');
xlabel('tau');
ylabel('Nb it');
