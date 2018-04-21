%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Algorithme de More_Sorensen
%On cherche � minimiser le sous probl�me:
%(P) g'*s + s'*H*s
% s.c. norm(s)<delta 
%Param�tres:
%           _g, H : vecteur et matrice de la fonction s -> g'*s + s'*H*s
%           _delta  : R�gion de confiance
%           _k_max : Nombre maximum d'it�rations
%Sorties:
%           _s : solution du probl�me de minimisation
%           _lambda_star : Multiplicateur de Lagrange associ� � s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [k_intern, s, lambda_star] = More_Sorensen( g, H , delta ,k_max,eps)

%% Préconditions
if (H~=H')
    s=NaN;
    lambda_star=NaN;
    disp('H non symetrique');
    return;
end
if (delta<=0)
    s=NaN;
    lambda_star=NaN;
    disp('delta doit être positif');
    return;
end
%% Préconditions respectées
kb=0;
k_intern=0;
[Q,D]=eig(H);
eigen=diag(D);
eigen=sort(eigen,'ascend');
pas_newton= -H\g;

if(eigen(1)>=0 && norm(pas_newton)<delta )
    % Solution interieure
    s=pas_newton;
    lambda_star=0;
else
    [n,m]=size(H);     
    nq=size(Q(:,1));
    % Calcul fonction et sa dérivée
    [f, derivee_f] = compute_fun(Q,g,eigen,nq,delta);
    %Bornes Pour Newton Non Linéaire%%
    [a,b,k_intern]=ComputeBornes(f, eigen(1), 0.01,k_intern );   

    if( Q(:,1)'*g~=0 )
        [ lambda_star , kb] = NoLinearNewton( f,derivee_f, eps, a,b , k_max);
        
        s=-(H +lambda_star*eye(n,m))\g;
    else 
        %Construction du vecteur s_l1 et calcul de sa norme
        [ns, s_l1]=compute_vector_sl1(eigen, Q, g);     

        if (ns>delta)
            [ lambda_star , kb] = NoLinearNewton( f,derivee_f, eps, a,b , k_max);
            
            s=-(H +lambda_star*eye(n,m))\g;
        else 
            %%Hard Case
            lambda_star=-eigen(1);
            %% On chercher alpha / : s=s_l1+alpha*q1
            alpha=sqrt(delta^2 - ns^2)/(norm(Q(:,1))^2);
            s=s_l1+alpha*Q(:,1);       
        end
    end
end
k_intern=k_intern+kb;
