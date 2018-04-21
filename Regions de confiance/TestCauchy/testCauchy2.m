%% Test pas de cauchy

g =  [6;2];
H =  [ 7 0 ; 0 2];
delta_k =(norm(g)^3)/(g'*H*g)+1;
[ sk, t_zero,valable  ] = pasCauchy ( delta_k  , g , H)