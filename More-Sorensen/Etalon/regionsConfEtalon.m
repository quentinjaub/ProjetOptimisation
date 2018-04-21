%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Algorithme regions de confiance
%Permet de minimiser une fonction f.
%Param�tres:
%           _f :  Fonction � minimiser
%           _grad_f : gradient de f
%           _hess_f : Hessienne de f
%           _x0 : Point de d�part
%           _nb_max : Nombre maximum d'it�rations
%           _delta_0 : R�gion de d�part
%           _delta_max : Plus grande r�gion accept�e
%           _ g1,g2 : Facteurs multiplicateurs de delta
%           _ n1,n2 : Facteurs pour juger la d�croissance de f
%R�sultat:
%           _nb_iter : Nombre d'it�rations
%           _xsol : Solution du probl�me de minimisation
%           _f_xsol : f(xsol)
%           _ngsol : norme du gradient en xsol
%           _nevals : nombre d'appels a la fonction et ses derivees
%           _delta_fin : R�gion de confiance finale
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ngsol, nevals,nb_iter, xsol, f_xsol, delta_fin ] = regionsConfEtalon( f, grad_f, hess_f ,x0,nb_max ,delta_0, delta_max, g1,g2,n1,n2,eps )

%%Preconditions
if(g1<=0 || g1>=1)
    disp('erreur g1')
end

if( g2<=1)
    disp('erreur g2')
end

if(n1<=0 || n1>=1)
    disp('erreur n1')
end

if(n2<=0 || n2>=1 || n2<=n1)
    disp('erreur n2')
end

if(delta_0<0 || delta_0>delta_max)
    disp('erreur delta 0')
end
if (delta_max<=0)
    disp('erreur delta_max')
end    
%%
xk=x0;
nevals=zeros(3,1);
%% delta_min
delta_min=10e-30;
gk_x0=grad_f(x0);
nevals(2)=nevals(2)+1;
delta_k=delta_0;
nb_iter=0;
gk=gk_x0;
[n,~]=size(gk);
sk=ones(n,1);
critere=convergenceReg(1, x0, xk ,gk, gk_x0, sk,delta_k,delta_min,nb_iter,nb_max,eps );


while(critere)
    flag_sk=0;
    %%Evaluation f,g,h en xk
    f_xk=f(xk);
    gk=grad_f(xk);
    Hk=hess_f(xk);
    nevals=nevals+ones(3,1);
    %%
   % [sk,~, ~ ]=pasCauchy( delta_k, gk , Hk );
   [sk,~,~,~] = etalonms( gk, Hk , delta_k ,eps);

    f_sk=f(xk+sk);
    nevals(1)=nevals(1)+1;
    rhok=(f_xk-f_sk)/(-gk'*sk-0.5*sk'*Hk*sk);
    %%maj xk
    if (rhok>=n1) 
        xk=xk+sk; 
        flag_sk=1;
    end
    %%Mag delta
    if (rhok>=n2)
        delta_k=min(g2*delta_k,delta_max); 
    else
        if (rhok <n1 )
          delta_k=g1*delta_k;
        end
    end
     nb_iter=nb_iter+1;
    %% Choix du critere
    if (flag_sk==0)
        critere=convergenceReg(1,x0,xk,gk,gk_x0, sk,delta_k,delta_min,nb_iter,nb_max,eps );
    else
        critere=convergenceReg(2,x0,xk,gk,gk_x0, sk,delta_k,delta_min,nb_iter,nb_max,eps );
    end
      
    
end    
%% Solutions � retourner

xsol=xk; 
f_xsol=f(xsol);
ngsol=norm(grad_f(xsol));
delta_fin=delta_k;   
