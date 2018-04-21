%% Test 1 de l'algorithme de Newton locale
%% Converge en 1 itération vers (1;1;1)
eps=10^-6;
x0=[1;0; 0];
k_max=10000;
[f, grad_f, hess_f] = f1();

scriptinit;
[ xs,nb_it, grad_f_xsol, neval ] = NewtonLocal(f,grad_f,hess_f,x0,eps,k_max);
scriptAffichageNL;