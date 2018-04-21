function [ phi, derivee_phi ] = fonctionNonLinear(a1, a2, b1, b2, delta)

  s=@(l) [a1/(l+a2) ; b1/(l+b2) ];
  %%Fonction
  phi=@(l) norm(s(l),2)^2 - delta^2;
  derivee_phi=@(l) (-(a1^2)*2/(l+a2)^3)+ (-(b1^2)*2/(l+b2)^3);
  
end