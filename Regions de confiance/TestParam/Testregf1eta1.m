%% Test f1
clear all
format long
[f, grad_f, hess_f] = f1() ;


x0=[16; 89; -2.2];
nb_max=50;
delta_0=1;
delta_max=10000;
g1=0.5;
g2=2.0;

n2=0.7;
eps=1e-6;

tab=zeros(100,1);
tab2=zeros(100,1);
n1=0.05;
for i =1:100
    
    [ngsol, nevals,nb_iter2, xsol2, f_xsol, delta_fin ]= regionsConf( f, grad_f, hess_f ,x0,nb_max, delta_0, delta_max, g1,g2,n1,n2,eps );
    tab(i)=n1;
    n1=n1+0.005
    tab2(i)=nb_iter2;
end

plot(tab,tab2)
title('Nb iterations = f1(eta_1) pour x0=[10; -3; -2.2];');
xlabel('eta_1');
ylabel('Nb it');
    
