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

function [ngsol, nevals,nb_iter, xsol, f_xsol, delta_fin ] = regionsConf( f, grad_f, hess_f ,x0,nb_max ,delta_0, delta_max, g1,g2,n1,n2,eps )

global neval flag_sk gk Hk ;

%%% Preconditions %%%
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
%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Affichage pour les tests
% disp('--------------------------------------');
% disp('Exemple : X0 =');
% disp(x0);
   
%%% Initialisation Variables %%%
xk=x0;
f_xk=f(xk);
neval=zeros(3,1);
gk_x0=grad_f(x0);
delta_k=delta_0;
nb_iter=0;
gk=gk_x0;
Hk=hess_f(xk);
[n,~]=size(gk);
x_k1=zeros(n,1);
f_sk=f_xk;
neval=neval+1;

[ critere, flag ]=convergenceReg(1, x0, xk ,gk, gk_x0, zeros(n,1),delta_k,x_k1,nb_iter,nb_max,eps );

while(critere)
    %% 0 -> xk+1=xk || 1 -> xk+1=xk+sk
    flag_sk=0;  
    %% Calcul du pas de Cauchy
    [sk,~, ~ ]=pasCauchy( delta_k, gk , Hk );
    f_sk=f(xk+sk);
    rhok=(f_xk-f_sk)/(-gk'*sk-0.5*sk'*Hk*sk);
    %% Script: MAJ de xk et delta_k suivant certaines conditions
    majData;
    nb_iter=nb_iter+1;
    %% Choix du critere
    if (flag_sk==0)
        [ critere, flag ]=convergenceReg(1,x0,xk,gk,gk_x0, sk,delta_k,x_k1,nb_iter,nb_max,eps );
    else
        [ critere, flag ]=convergenceReg(2,x0,xk,gk,gk_x0, sk,delta_k,x_k1,nb_iter,nb_max,eps );
    end
    
    % maj evaluations de f,
    neval(1)=neval(1)+1;
end    

%% Solutions � retourner
scritcritreg;
nevals=neval;
xsol=xk; 
f_xsol=f(xsol);
ngsol=norm(grad_f(xsol));
delta_fin=delta_k;   
