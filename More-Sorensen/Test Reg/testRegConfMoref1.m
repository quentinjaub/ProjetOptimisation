%% Test f1
clear all
format long

[f, grad_f, hess_f] = f1();

x0=[1; 0 ; 0];
nb_max=50;
delta_0=2;
delta_max=10;
g1=0.5;
g2=2.0;
n1=0.25;
n2=0.75;
eps=1e-3;
scriptinit;
[ngsol, nevals,nb_iter, xsol, f_xsol, delta_fin, nb_intern ]= regionsConfMore( f, grad_f, hess_f ,x0,nb_max, delta_0, delta_max, g1,g2,n1,n2,eps );
ScriptAffReg1;


x0=[10; 3; -2.2];
scriptinit;
[ngsol, nevals,nb_iter, xsol, f_xsol, delta_fin, nb_intern ]= regionsConfMore( f, grad_f, hess_f ,x0,nb_max, delta_0, delta_max, g1,g2,n1,n2,eps );
ScriptAffReg1;


