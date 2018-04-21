%% Test Lagrangien Augmente

clear all
format long

[f, grad_f, hess_f] = f1();
x0=[0; 1; 1];
nb_max=50;
l0=4;
delta_0=1;
delta_max=10;
nbmax_sp=50;
global mu0 tho nt0 a b;
a=0.1;
b=0.9;
mu0=10;
nt0=0.1258925^3;
tho=1.01;

%%% Contrainte pour f1
[ c, deriv_c, d2c ] = contrainte(1);
[ xsol, lsol, musol, k, c_x , nb_intern] = Lagrangien(flag,  x0, l0, f, c, grad_f, deriv_c, hess_f, d2c, nb_max,delta_0, delta_max, nbmax_sp );