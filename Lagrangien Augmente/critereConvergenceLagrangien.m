%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Critere de convergence du Lagrangien augmente
%  _ Flag_sortie : 0 : Nombre d'itérations max atteint
%                  1 : Norme gradient nulle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ flagSortie, critere ] = critereConvergenceLagrangien( epsgrad, epsCon, xk,xk_1,grad_f_x, grad_f_x0, k, kmax, c_x, c_x0 )

    critere_grad=(norm(grad_f_x)>epsgrad*(norm(grad_f_x0)+(1e-16)^0.5)) || ( norm(c_x)>epsCon*(c_x0+(1e-16)^0.5) );
    critere = (k<kmax) && ( critere_grad ) && (norm(xk-xk_1)>(10e-6)*(norm(xk_1)+(1e-16)^0.5)) ;
    
    if(k>=kmax)
        flagSortie=0;
    elseif(critere_grad==0)
        flagSortie=1;
    else 
        flagSortie=2;
    end

end

