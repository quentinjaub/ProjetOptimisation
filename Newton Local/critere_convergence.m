%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Fonction critere_convergence
% Calcule le critere de converge de Newton locale
% i.e. Nombre d'it�rations major� & norm(grad_f(x))> epsilon relatif
% Utilise tol=(1e-16)^0.5 dans le cas ou grad_f_x0==0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [flag, critere] = critere_convergence(i,grad_f_x,grad_f_x0, eps, k, k_max , x_k, x_k1)
tol=(10^-16)^0.5;
switch i 
    case 1
        n=norm(grad_f_x,2);
        critere = ((k_max>k) && (n>eps*(norm(grad_f_x0)+ tol) ) ) && ( norm(x_k-x_k1)>eps*(norm(x_k1)+tol));
        if (k>=k_max)
          flag=0;
        elseif (n<=eps*(norm(grad_f_x0)+ tol) ) 
          flag=1;
        else
          flag=2;
        end
    case 2
        n=norm(grad_f_x,2);
        critere = ((k_max>k) && (n>eps*(norm(grad_f_x0)+ tol) ) ) ;
        if (k>=k_max)
          flag=0;
        elseif (n<=eps*(norm(grad_f_x0)+ tol) ) 
          flag=1;
        else
          flag=2;
        end
    otherwise  
          critere = True;
end

