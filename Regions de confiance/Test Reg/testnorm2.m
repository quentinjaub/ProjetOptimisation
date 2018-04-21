%% Test reg conf
clear all
f= @(x) 3+0.5*norm(x)^2;
g=@(x) x;
h=@(x) eye(3,3);
x0=[1; 2; 1];
nb_max=10e6;
delta_0=3;
delta_max=10*norm(x0);
g1=0.5;
g2=2;
n1=0.25;
n2=0.75;
eps=1e-3;
[ngsol, nevals,nb_iter, xsol, f_xsol, delta_fin ] = regionsConf( f, g, h ,x0,nb_max, delta_0, delta_max, g1,g2,n1,n2,eps )