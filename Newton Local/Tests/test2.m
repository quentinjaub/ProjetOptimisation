%% Test 2 de l'algorithme de Newton locale
%% Ne converge pas pour ce x0
%x0=[0;(1/200) + (1/(10^12))];
eps=10^-6;
x0=[10; 0];

k_max=10000;

[f, grad_f, hess_f] = f2();
scriptinit;

[ xs,nb_it, grad_f_xsol, neval ] = NewtonLocal(f,grad_f,hess_f,x0,eps,k_max);
scriptAffichageNL;


x0=[-1.2;1];
scriptinit;
[ xs,nb_it, grad_f_xsol, neval ] = NewtonLocal(f,grad_f,hess_f,x0,eps,k_max);
scriptAffichageNL;

x0=[0;(1/200) + (1/(10^12))];
scriptinit;
[ xs,nb_it, grad_f_xsol, neval ] = NewtonLocal(f,grad_f,hess_f,x0,eps,k_max);
scriptAffichageNL;