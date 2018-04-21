%% Test pas de cauchy

g =  [-2 ; 1];
H =  [ -2 0 ; 0 10];
delta_k =(norm(g)^3)/(g'*H*g)+1;
eps=1e-6;
[ k, s,l  ] = More_Sorensen ( g , H,delta_k,1e6,eps)