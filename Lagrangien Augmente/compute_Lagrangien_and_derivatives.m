%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonction compute_Lagrangien_and_derivatives
% Calcul du lagrangien, de son gradient et sa
% hessienne.
% Permet d'all�ger le programme principal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [grad_Lam,La, grad_La, hess_La] = compute_Lagrangien_and_derivatives(f,grad_f,hess_f, c, deriv_c, d2c,l,muk)
    grad_Lam=@(x) grad_f(x) + deriv_c(x)'*l;
    La=@(x) f(x) + c(x)'*l + (muk/2)*norm(c(x))^2;
    grad_La=@(x) grad_f(x) + deriv_c(x)'*l + muk*deriv_c(x)'*c(x);
    
    %% Calcul de d2c'*l
    d2c_by_l=compute_d2c_by_l(d2c,l);
    d2c_by_c=compute_d2c_by_l(d2c,l);
    hess_La=@(x) hess_f(x) + d2c_by_l(x) + muk*( d2c_by_c(x) + deriv_c(x)'*deriv_c(x));
 
end