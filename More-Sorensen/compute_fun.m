%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fonction compute_fun
%Permet de calculer norm(s(l))^2-delta^2 
%ainsi que sa dérivée
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [f, derivee_f] = compute_fun(Q,g,eigen,nq,delta);

    fun=@(l) -sum((repmat((Q'*g)',nq ).*Q)./repmat((eigen+l)',nq),2);
    %%Il est pr�f�rable d'inverser f et delta
    f=@(s) norm(fun(s))^2-delta^2;
    fun_d=@(l)  sum((repmat((Q'*g)',nq).*Q)./repmat((eigen+l)',nq).^(3/2) ,2) ;
    derivee_f=@(s) -2*norm(fun_d(s))^2;

end

