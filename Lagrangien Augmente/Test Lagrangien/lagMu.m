%% Test Lagrangien Augmente sur tho
%flag,  x0, l0, f, c, grad_f, deriv_c, hess_f, d2c, kmax
clear all
close all
format long

[f, grad_f, hess_f] = f2();
x0=[sqrt(3)/2;sqrt(3)/2];
nb_max=50;
nbmax_sp=50;
l0=1;
delta_0=1;
delta_max=10;

global mu0 nt0 a b;
a=0.1;
b=0.9;
mu0=10;
nt0=0.1258925;
tho=1.1;


[ c, deriv_c, d2c ] = contrainte(2);
tab=zeros(100,1);
tab2=zeros(100,1);

for i = 1:100
    [k]=testLag(3,  x0, l0, f, c, grad_f, deriv_c, hess_f, d2c, nb_max,delta_0, delta_max, nbmax_sp, 'f2',tho );
    mu0=mu0+5;
    tab(i) = mu0;
    tab2(i) = k;
end;


% tab3=zeros(100,1);
% tab4=zeros(100,1);
% tho=1.01;
% for i = 1:100
%     testLag(2,  x0, l0, f, c, grad_f, deriv_c, hess_f, d2c, nb_max,delta_0, delta_max, nbmax_sp, 'f2' );
%     tho=tho+0.2;
%     tab3(i) = tho;
%     tab4(i) = k;
%        
% end;
% 

% 
% tab5=zeros(100,1);
% tab6=zeros(100,1);
% tho=1.01;
% 
% for i = 1:100
%     testLag(1,  x0, l0, f, c, grad_f, deriv_c, hess_f, d2c, nb_max,delta_0, delta_max, nbmax_sp, 'f2' );
%     tho=tho+0.2;
%     tab5(i) = tho;
%     tab6(i) = k;
%        
% end;
plot(tab,tab2)
title('Nb iterations = f(mu) pour x0=[sqrt(3)/2;sqrt(3)/2](Newton)');
xlabel('mu');
ylabel('Nb it');
% plot(tab3,tab4)
% title('Nb iterations = f(tau) pour x0 = [1;0] ( Newton)');
% xlabel('tau');
% ylabel('Nb it');
% 
% plot(tab5,tab6)
% title('Nb iterations = f(tau) pour x0 = [1;0] (Reg+M)');
% xlabel('tau');
% ylabel('Nb it');

% 
% testLag(2,  x0, l0, f, c, grad_f, deriv_c, hess_f, d2c, nb_max,delta_0, delta_max , nbmax_sp, 'f2');
% 
% testLag(1,  x0, l0, f, c, grad_f, deriv_c, hess_f, d2c, nb_max,delta_0, delta_max, nbmax_sp , 'f2');