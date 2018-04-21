%% Test f2
clear all
format long
[f, grad_f, hess_f] = f2() ;


x0=[100;-5];
nb_max=100;
delta_0=1;
delta_max=10000;
g1=0.5;
g2=2.0;

n1=0.25;
n2=0.75;
eps=1e-8;

tab=zeros(100,1);
tab2=zeros(100,1);
g2=1.1;
for i = 1:100
    [ngsol, nevals,nb_iter2, xsol2, f_xsol, delta_fin ]= regionsConf( f, grad_f, hess_f ,x0,nb_max, delta_0, delta_max, g1,g2,n1,n2,eps );
    tab(i)=g2;
    g2=g2+0.1;
    tab2(i)=nb_iter2;
end

plot(tab,tab2)
title('Nb iterations = f(g2) pour x0 = [10;0]');
xlabel('gamma_2');
ylabel('Nb it');
