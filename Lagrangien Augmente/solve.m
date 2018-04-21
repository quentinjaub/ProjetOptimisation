function [xk,ksolve,delta_k] = solve(flag, La, grad_La, hess_La, kmax, epsk, xk,delta_0, delta_max)

switch flag
    
    case 1 
        %% Newton Local
        [xk,ksolve, ~, ~] = NewtonLocal(La,grad_La,hess_La,xk,epsk,kmax);
        delta_k=0;
    case 2
        %% Regions de confiance + Cauchy
        g1=0.5;
        g2=2.0;
        n1=0.25;
        n2=0.75;
        [~,~,ksolve, xk, ~, delta_k] = regionsConf( La, grad_La, hess_La ,xk,kmax ,delta_0, delta_max, g1,g2,n1,n2,epsk );
    
    case 3
        %% Regions de confiance + More Sorensen
        g1=0.5;
        g2=2.0;
        n1=0.25;
        n2=0.75;
        [~, ~,ksolve, xk, ~, delta_k,nb_i ] = regionsConfMore(  La, grad_La, hess_La ,xk,kmax ,delta_0, delta_max, g1,g2,n1,n2,epsk );
        ksolve=ksolve+nb_i;
    otherwise
        xk=NaN;
        ksolve=NaN;
        delta_k=0;

end

