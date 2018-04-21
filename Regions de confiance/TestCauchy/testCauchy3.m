%% Test pas de cauchy

g =  [-2;1];
H =  [ -2 ,0 ; 0 ,10];
delta_k =(norm(g)^3)/(g'*H*g)+1;
[ sk,t_zero, valable  ] = pasCauchy ( delta_k  , g , H)