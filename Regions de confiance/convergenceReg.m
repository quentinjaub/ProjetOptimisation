%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Critère de convergence des regions de confiance
% On teste :
%           _Nombre d'itérations < Nombre max
%           _ Suite (xk) non stationnaire
%           _ norme de grad_f(x) > epsilon relatif
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ critere, flag ] = convergenceReg(i, x0,xk ,gk, gk_x0, sk,delta_k,x_k1,nb_iter,nb_max,eps )

switch i 
    case 1
        critere=(nb_iter<nb_max );
        flag=0;
    case 2
        critere=(nb_iter<nb_max && norm(gk)>eps*(norm(gk_x0)+(1e-16)^0.5) && norm(sk)>eps*(norm(x_k1)+(1e-16)^0.5));
        if ((nb_iter>=nb_max))
            flag=0;
        elseif (norm(gk)<=eps*(norm(gk_x0)+(1e-16)^0.5))
            flag=1;
        else
            flag=2;
        end
end

