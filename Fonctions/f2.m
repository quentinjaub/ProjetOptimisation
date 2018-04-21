
function [f, grad_f, hess_f] = f2()

f=@(x) (1-x(1))^2 + 100*(x(2)-x(1)^2)^2;

grad_f= @(x) [ 2*x(1) - 400*x(1)*(- x(1)^2 + x(2)) - 2, - 200*x(1)^2 + 200*x(2)]';
            
hess_f=@(x) [1200*x(1)^2 - 400*x(2) + 2 ,  -400*x(1);
            -400*x(1) , 200];