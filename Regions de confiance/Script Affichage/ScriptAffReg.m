disp('La solution trouvee est xsol = ')
disp(xsol)
disp(['Nombre d iterations : ', num2str(nb_iter)])

disp(['Norme du gradient en xs : ', num2str(ngsol)])
disp(['Nombre d evaluations de f  : ', num2str(nevals(1))])
disp(['Nombre d evaluations du gradient de f  : ', num2str(nevals(2))])
disp(['Nombre d evaluations de la hessienne de f  : ', num2str(nevals(3))])