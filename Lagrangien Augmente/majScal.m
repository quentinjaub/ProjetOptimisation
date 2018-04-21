%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mise à jour des scalaires utilisés dans la méthode
% des multiplicateurs de Lagrange.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [lk,muk,epsk,nk ] = majScal(c_xk, nk, lk, epsk, muk,tho)
global mu0 nt0 a b;
if (norm(c_xk)<= nk)       
        lk=lk+muk*c_xk;
        epsk=epsk/muk;
        nk=nk/muk^b;  
else        
        muk=tho*muk;
        epsk=1/(mu0*muk);
        nk=nt0/muk^a;       
end
end

