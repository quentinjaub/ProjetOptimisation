%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Algorithme du Lagrangien Augmente
% Utile pour l'optimisation avec contraintes.
% Afin de minimiser le lagrangien à chaque itération,
% j'utilise le flag suivant :
%       _1 : Minimisation avec Newton Local
%       _2 : Regions de confiance avec pas de cauchy
%       _3 : Regions de confiance avec More Sorensen
%Entrees:
%       _flag : décrit ci dessus
%       _mu0,tho,nt0,a,b : Constantes données
%       _f, grad_f, hess_f : Fonction f: Rn->R à étudier avec son gradient et sa
%       hessienne
%       _c, deriv_c, d2c : Fonction c: Rn->Rm ( Contrainte ) avec ses
%       dérivées première et seconde
%       _kmax: Nombre max d'itérations
% Sorties:
%       _xsol : Solution du problème d'optimisation
%       _lsol : Multiplicateur de Langrage associé
%       _musol : mu final
%       _k : Nombre d'itérations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




function [ xsol, lsol, musol, k, c_x,nb_intern ] = Lagrangien(flag,  x0, l0, f, c, grad_f, deriv_c, hess_f, d2c, kmax , delta_0, delta_max, nbmax_sp,tho)

global mu0 nt0 a b;


%% Création constantes %%
eps0=1/mu0;
epsk=1/mu0;
nk=nt0/(mu0^a);
xk=x0;
lk=l0;
muk=mu0;
grad_f_x0=grad_f(x0);
xk_1=zeros(size(xk(:)));
k=0;
c_x0=c(x0);
c_x=c_x0;

[ flagSortie, critere ] = critereConvergenceLagrangien( epsk,epsk,xk,xk_1, grad_f_x0, grad_f_x0, k, kmax, c_x0, c_x0 );
nb_intern=0;
while(critere)
    [gLam,La, grad_La, hess_La] = compute_Lagrangien_and_derivatives(f,grad_f,hess_f, c, deriv_c, d2c, lk, muk);
    xk_1=xk;
    
    [xk,ksolve,delta_k] = solve(flag, La, grad_La, hess_La, nbmax_sp, epsk, xk,delta_0, delta_max);
    c_x=c(xk);
    grad_xk=gLam(xk);
    grad_x0=gLam(x0);
    %Test de fin
    [ flagSortie, critere ] = critereConvergenceLagrangien( epsk,epsk,xk,xk_1,grad_xk, grad_x0, k,kmax, c_x, c_x0 );
    k=k+1;
    nb_intern=nb_intern+ksolve;

    if(critere==0) %% Critere = false %%
        break;
    end
    
    % Maj des scalaires
    [lk,muk,epsk,nk ] = majScal(c_x, nk, lk, epsk, muk,tho);  
end


scriptcritlag;

xsol=xk;
lsol=lk;
musol=muk;

