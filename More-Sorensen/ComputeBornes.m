%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calcul des bornes inf et sup afin d'appliquer
% l'algorithme de Newton Non Lineaire sur f
% dans l'algorithme de More Sorensen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ a,b,k ] = ComputeBornes( f , eigen1, tol,k )

    a=max(-eigen1,0)+tol;
    b=2*a;
    while(f(b)>=0 )
        b=2*b;
        k=k+1;
    end
end

