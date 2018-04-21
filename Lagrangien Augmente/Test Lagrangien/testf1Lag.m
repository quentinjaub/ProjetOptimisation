%% Test Lagrangien Augmente

clear all
format long

[f, grad_f, hess_f] = f1();
x0=[0; 1; 1];
nb_max=50;
l0=0;
delta_0=1;
delta_max=10;
nbmax_sp=50;
global mu0 nt0 a b;
a=0.1;
b=0.9;
mu0=100;
nt0=0.1258925;
tho=1.01;

%%% Contrainte pour f1
[ c, deriv_c, d2c ] = contrainte(1);

testLag(3,  x0, l0, f, c, grad_f, deriv_c, hess_f, d2c, nb_max,delta_0, delta_max, nbmax_sp, 'f1' ,tho);

testLag(2,  x0, l0, f, c, grad_f, deriv_c, hess_f, d2c, nb_max,delta_0, delta_max , nbmax_sp, 'f1',tho);

testLag(1,  x0, l0, f, c, grad_f, deriv_c, hess_f, d2c, nb_max,delta_0, delta_max, nbmax_sp , 'f1',tho);