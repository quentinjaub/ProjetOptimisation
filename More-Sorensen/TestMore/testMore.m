%% Test More-Sorensen
format long
disp('-------------------------------')
disp('Exemple 1: delta=1 ,g=(0,0)')
g =  [0;0];
H =  [ -2 0 ; 0 10];
delta_k = 1;
[k, s,l  ] = More_Sorensen ( g , H,delta_k,1e6,1e-6)

disp('-------------------------------')
disp('Exemple 2 : delta=1 , g=(2,3)')
g =  [2;3];
H =  [ 4 6 ; 6 5];
delta_k = 1;
[k, s,l  ] = More_Sorensen ( g , H,delta_k,1e6,1e-6)

disp('-------------------------------')
disp('Exemple 3: delta=0.1 , g=(2,0)')
g =  [2;0];
H =  [ 4 0 ; 0 -15];
delta_k = 2;
[k, s,l  ] = More_Sorensen ( g , H,delta_k,1e6,1e-6)