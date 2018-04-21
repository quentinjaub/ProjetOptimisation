%% Test f2 sur delta_0
clear all
format long
[f, grad_f, hess_f] = f2() ;


x0=[0;1/200 + 1e-12];
nb_max=50;
delta_0=0.1;
delta_max=10000;
g1=0.5;
g2=2.0;

n1=0.25;
n2=0.75;
eps=1e-6;

tab=zeros(100,1);
tab2=zeros(100,1);

for i = 1:100
    [ngsol, nevals,nb_iter2, xsol2, f_xsol, delta_fin ]= regionsConf( f, grad_f, hess_f ,x0,nb_max, delta_0, delta_max, g1,g2,n1,n2,eps );
    tab(i)=delta_0;
    delta_0=delta_0+0.1;
    if (i==10)
      xsol2
    end
    if (i==20)
      xsol2
    end
    if (i==30)
      xsol2
    end
     if (i==80)
      xsol2
    end
    tab2(i)=nb_iter2;
end

plot(tab,tab2)
title('Nb iterations = f(d_0) pour x0 = [0;1/200 + 1e-12]');
xlabel('d_0');
ylabel('Nb it');
