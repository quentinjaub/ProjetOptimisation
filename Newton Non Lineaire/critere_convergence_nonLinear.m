function [flag, critere] = critere_convergence_nonLinear(i,k,k_max, phi_l,phi_lmin,phi_lmax,eps )

switch i 
    case 1
        
        critere = ( (k_max>k) && (phi_lmin*phi_lmax<=0) && (abs(phi_l)>eps)   );
        if (k>=k_max)
          flag=0;
        else
          flag=1;
        end
    otherwise  
           critere = True;
end