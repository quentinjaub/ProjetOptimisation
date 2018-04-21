%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonction compute_d2c_by_l
% Utile car d2c est potentiellement une matrice tridimensionnelle
% et matlab ne sait pas faire le produit d2c'*l
%Entrees:
%           _d2c: Matrice 
%           _l: Vecteur
%Sortie:
%           _Le resultat somme ( l(i)*d2c(:,:,i) )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [d2c_by_l] =compute_d2c_by_l(d2c,l)
  [nl,~]=size(l(:));
  if (nl~=1)
      [n,m]=size(d2c(:,:,1)');
      d2c_by_l=@(x) zeros(n,m);
      for i = 1: nl
          d2c_by_l=@(x) (d2c_by_l+l(i)*(d2c(:,:,i)'));
      end
  else
      d2c_by_l=@(x)l*d2c(x);
  end
end
