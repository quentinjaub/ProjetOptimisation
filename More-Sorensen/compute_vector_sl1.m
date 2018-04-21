%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calcul du vecteur s_l1 et de sa norme 
% utile pour l'algorithme de More Sorensen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ns, s_l1]=compute_vector_sl1(eigen, Q, g);

    s_l1=-Q(:,2:end)*Q(:,2:end)'*g./(eigen(2:end)-eigen(1));
    ns=norm(s_l1);
end

