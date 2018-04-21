%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonction pasCauchy : Calcul du pas de cauchy
% Details : 
    % Expression quadratique
    %% On considere p(t) = qk ( -t delta gk/ norm(gk)) , avec t dans [0,1]
    % On se ram�ne a:
    %               _P : R->R
    %               _sur l'intervalle [0,1] 
    %               _on considère bien la contrainte s=-tgk
    %%
    %p = @(t) f_xk + gk'*(-t*delta_k*gk/norm(gk)) + (0.5*-t*delta_k*gk'/norm(gk))*(Hk*-t*delta_k*gk/norm(gk)) ;

    %gradient de  p
    %grad_p = @(t) -delta_k*norm(gk) + t* delta_k^2 *(gk'*(Hk*gk))/(norm(gk)^2);
% Entrees :
%   delta_k : region de confiance actuelle
%   gk : grad_f(xk)
%   Hk : hess_f(xk)
%
% Sorties:
%   sk : Pas de cauchy
%   t_zero : scalaire tel que s=-t*gk
%   valable : vaut 1 si norm(sk) trouv� est bien dans la r�gion de confiance
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ sk, t_zero, valable  ] = pasCauchy ( delta_k , gk , Hk )
if (norm(gk)==0)
    t_zero=0;
    sk=-t_zero*gk;
    valable=1;
else
    %c=(0.5*(delta_k^2)*gk'*Hk*gk)/(norm(gk)^2);
    c=gk'*Hk*gk;
    if (c<=0)
        t_zero=1;  
    else
    % tzero / grad_p(t_zero) ==0 
        t_zero=min(1,(norm(gk)^3)/(delta_k * c));
    end
    if ( abs(t_zero) <=1 ) 
        valable=1;
    else
        valable=0;
    end
    %% On multiplie t_zero par delta_k/norm(gk) pour effacer le changement d'indice
    sk=-t_zero*delta_k*gk/norm(gk);
end    
end