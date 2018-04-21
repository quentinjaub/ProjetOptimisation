%% Affichage de la cause d'arret %%
 disp('--------------------------------------');
 disp('Cause d arret : ');
 if (flag==0)
     
     disp('Nombre d iterations max est depasse');
     disp('-------------------------------------');
 elseif(flag==1)
     disp(['Norme du gradient proche de 0 : norm(grad_f)(xs) = ', num2str(norm(grad_f_x))]);
     disp('--------------------------------------');
 else 
     disp('Suite stationnaire');
     disp('-------------------------------------');
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%