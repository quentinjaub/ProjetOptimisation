%% Test pas de cauchy

g =  [0;0];
H =  [ 7 0 ; 0 2];
delta_k = 1;
[ sk,t_zero, valable  ] = pasCauchy ( delta_k , g , H)