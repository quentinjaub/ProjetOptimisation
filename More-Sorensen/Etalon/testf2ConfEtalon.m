%% test reg fourni
clear all
format long
f=@(x) (1-x(1))^2 + 100*(x(2)-x(1)^2)^2;

grad_f= @(x) [ 2*x(1) - 400*x(1)*(- x(1)^2 + x(2)) - 2, - 200*x(1)^2 + 200*x(2)]';
            
hess_f=@(x) [1200*x(1)^2 - 400*x(2) + 2 ,  -400*x(1);
            -400*x(1) , 200];
%x0=[0;(1/200) + (1/(10^12))];
x0=[-1.2; 1];
nb_max=50;
delta_0=1;
delta_max=10;
g1=0.5;
g2=2.0;
n1=0.25;
n2=0.75;
eps=1e-6;
disp('Exemple 1 : x0=[-1.2; 1];');
[ngsol, nevals,nb_iter, xsol, f_xsol, delta_fin ]= regionsConfEtalon( f, grad_f, hess_f ,x0,nb_max, delta_0, delta_max, g1,g2,n1,n2,eps )

disp('Exemple 2 : x0=[10; 0];');
x0=[10; 0];
[ngsol, nevals,nb_iter, xsol, f_xsol, delta_fin ]= regionsConfEtalon( f, grad_f, hess_f ,x0,nb_max, delta_0, delta_max, g1,g2,n1,n2,eps )


disp('Exemple 3 : x0=[0; 0.005];');
x0=[0; 0.005+1e-12];
[ngsol, nevals,nb_iter, xsol, f_xsol, delta_fin ]= regionsConfEtalon( f, grad_f, hess_f ,x0,nb_max, delta_0, delta_max, g1,g2,n1,n2,eps )

disp('Exemple 4 : x0=[0; 1];');
x0=[0; 1];
[ngsol, nevals,nb_iter, xsol, f_xsol, delta_fin ]= regionsConfEtalon( f, grad_f, hess_f ,x0,nb_max, delta_0, delta_max, g1,g2,n1,n2,eps )

disp('Exemple 5 : x0=[2; 1];');
x0=[2; 1];
[ngsol, nevals,nb_iter, xsol, f_xsol, delta_fin ]= regionsConfEtalon( f, grad_f, hess_f ,x0,nb_max, delta_0, delta_max, g1,g2,n1,n2,eps )

disp('Exemple 6 : x0=[1; 2];');
x0=[1; 2];
[ngsol, nevals,nb_iter, xsol, f_xsol, delta_fin ]= regionsConfEtalon( f, grad_f, hess_f ,x0,nb_max, delta_0, delta_max, g1,g2,n1,n2,eps )
