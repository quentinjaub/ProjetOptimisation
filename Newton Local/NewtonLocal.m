%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Function NewtonLocal
% Applique l'algorithme de Newton Local à une fonction f
% Entrée :
%           _Fonction f: Rn->R
%           _x0 dans Rn :  vecteur de départ
%           _eps : précision demandée
%           _k_max: nombre max d'itérations
%Sortie:
%           _xs : solution de l'algorithme
%           _nb_it : nombre d'itérations
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ xs,nb_it, grad_f_xsol, neval ] = NewtonLocal(f,grad_f,hessian_f,x0,eps,k_max)

neval=zeros(3,1);
neval(2:3)=[2;1];
%%% Initialisation Variables %%%
[n,~]=size(x0);
grad_f_x0=grad_f(x0);
%% x a l'indice k-1
x_k1=zeros(n,1);
x=x0;
grad_f_x=grad_f(x0);
hessian_f_x=hessian_f(x0);
k=0;
[flag, critere] = critere_convergence(2,grad_f_x,grad_f_x0,eps,k,k_max,x, x_k1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

while (critere)
    %%x = sol de hessian_f_x * dk= -grad_f_x
    dk=direction_descente(grad_f_x,hessian_f_x);
    x_k1=x;
    x=x+dk;
    k=k+1;
    grad_f_x=grad_f(x);
    hessian_f_x=hessian_f(x);
    neval(2:3)=neval(2:3)+[1;1];
    [flag, critere] = critere_convergence(1,grad_f_x,grad_f_x0,eps,k,k_max,x, x_k1);
end

scriptcrit;

xs=x;
nb_it=k;
grad_f_xsol=grad_f_x;
