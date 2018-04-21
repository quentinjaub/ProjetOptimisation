%% Mise à jour des données dans l'algorithme 
%  des regions de confiance


global neval flag_sk gk Hk;

if (rhok>=n1) 
        %%maj xk : f(xk) <--old f(xk+sk) 
        x_k1=xk;
        xk=xk+sk; 
        f_xk=f_sk;
        gk=grad_f(xk);
        Hk=hess_f(xk);
        flag_sk=1;
        neval(2:3)=neval(2:3)+1;
    end
    %%Mag delta
    if (rhok>=n2)
        delta_k=min(g2*delta_k,delta_max); 
    else
        if (rhok <n1 )
          delta_k=g1*delta_k;
        end
    end



