disp('La solution trouvee est xsol = ')
disp(xs)
disp(['Nombre d iterations : ', num2str(nb_it)])
disp(['Norme du gradient en xs : ', num2str(norm(grad_f_xsol))])
disp(['Nombre d evaluations de f  : ', num2str(neval(1))])
disp(['Nombre d evaluations du gradient de f  : ', num2str(neval(2))])
disp(['Nombre d evaluations de la hessienne de f  : ', num2str(neval(3))])