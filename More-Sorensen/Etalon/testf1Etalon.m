%% Test f1
clear all
format long

f=@(x) 2*(x(1)+x(2)+x(3)-3)^2 +(x(1)-x(2))^2 + (x(2)-x(3))^2;


grad_f= @(x) [4*(x(1)+x(2)+x(3)-3) + 2*(x(1)-x(2)) ;
        4*(x(1)+x(2)+x(3)-3) - 2*(x(1)-x(2)) + 2*(x(2)-x(3));
        4*(x(1)+x(2)+x(3)-3)-2*(x(2)-x(3))];
    
    
hess_f=@(x) [6 2 4 ; 2 8 2 ; 4 2 6 ];

x0=[1; 0; 0];
nb_max=50;
delta_0=2;
delta_max=10;
g1=0.5;
g2=2.0;
n1=0.25;
n2=0.75;
eps=1e-3;
disp('Exemple 1 : x0=[1; 0; 0];');
[ngsol, nevals,nb_iter, xsol, f_xsol, delta_fin ]= regionsConfEtalon( f, grad_f, hess_f ,x0,nb_max, delta_0, delta_max, g1,g2,n1,n2,eps )

disp('Exemple 2 : x0=[10; 3; -2.2];');
x0=[10; 3; -2.2];
[ngsol, nevals,nb_iter, xsol, f_xsol, delta_fin ]= regionsConfEtalon( f, grad_f, hess_f ,x0,nb_max, delta_0, delta_max, g1,g2,n1,n2,eps )


