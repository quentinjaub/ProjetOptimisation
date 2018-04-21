%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fonction direction_descente
% Calcule la direction de descente -(hess_f(x)^-1)*grad_f(x)
%Entrées :
%           _grad_f_x : gradient de f en x
%           _hess_f_x : Hessienne de f en x
%Sortie
%           _ direc : La direction de plus profonde descente 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [direc] = direction_descente(grad_f_x,hess_f_x )
direc=-(hess_f_x)\(grad_f_x);

end