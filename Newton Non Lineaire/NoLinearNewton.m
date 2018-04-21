%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Algorithme Newton non lin�aire
%Permet de trouver une solution � l'�quation phi(l)=0
%pour phi non lin�aire de la variable r�elle.
%Param�tres:
%           _phi : Fonction de R->R
%           _derivee_phi : D�riv�e de phi
%           _eps : Tol�rance
%           _lmin : Borne inf de l'intervalle
%           _lmax : Borne sup de l'intervalle
%           _k_max : Nombre max d'it�rations
%Sorties:
%           _lsol : Solution de l'�quation phi=0
%           _k : Nombre d'it�rations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ lsol , k, phi_lsol, neval ] = NoLinearNewton( phi,derivee_phi, eps, lmin, lmax , k_max)
neval=[2;0];
phi_min=phi(lmin);
phi_max=phi(lmax);
if ( phi_min * phi_max )>0
    %% On ne peut pas appliquer l'alorithme
    lsol=NaN;
    k=NaN;
    disp('erreur sur lmin et lmax');
    return;
end

%% Affichage pour les tests
% disp('----------  Exemple  ---------------')
% disp(['Borne inf : ', num2str(lmin) ]);
% disp(['Borne sup : ', num2str(lmax) ]);
% disp('------------------------------------')
%% Cas ou lmin/lmax est déja la solution
k=0;

philmin=min(abs(phi_min),abs(phi_max) );
if (philmin<eps)
    if (phi(phi_min)==philmin)
        lsol=lmin;
    else
        lsol=lmax;
    end
    phi_lsol=phi(lsol);
else
%% Sinon ....
    
      lambda=lmax;
      phi_l=phi_max;

     [flag, critere] = critere_convergence_nonLinear(1,k,k_max, phi_l,phi_min,phi_max,eps );
     while(critere) 
           
           %% Dérivée de phi en lambda            
           dphi_lambda=derivee_phi(lambda);
           neval(2)=neval(2)+1;
           %Itéré Newton: lambda_N
           lambda_N=lambda-(phi_l/dphi_lambda);

           if (lambda_N>=lmin && lambda<=lmax && abs(phi(lambda_N))<0.5*abs(phi_l))
               lambda=lambda_N;
               neval(1)=neval(1)+1;
               phi_l=phi(lambda_N);
           else
               %%Dichotomie
               l_D= (lmin+lmax)/2;
               phi_ld=phi(l_D);
                neval(1)=neval(1)+1;
               if ((phi_ld*phi_max)<=0)
                   lmin=l_D;
                   phi_min=phi_ld;
               else
                   lmax=l_D;
                   phi_max=phi_ld;
               end
               lambda=l_D;
               phi_l=phi_ld;
           end
           k=k+1;
           [flag, critere] = critere_convergence_nonLinear(1,k,k_max, phi_l,phi_min,phi_max,eps);
          
     end
     
 %    disp(' Cause d arret : ')
  %   if (flag==0)
%        disp('Nombre d iterations max est depasse')
 %       disp('--------------------------------------')
 %    else
 %       disp(['Norme de phi(l) proche de 0 : norm = ', num2str(norm (phi_l)) ])
 %       disp('--------------------------------------')   
 %    end
     lsol=lambda;
     phi_lsol=phi_l;
end



