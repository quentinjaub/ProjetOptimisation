 
 disp('--------------------------------------');
 disp('Cause d arret : ');
 if (flag==0)
     
     disp('Nombre d iterations max est depasse');
     disp('--------------------------------------');
 elseif (flag==1)
 
     disp('Norme du gradient proche de 0 ');
     disp('--------------------------------------');
 else
 
     disp('Suite stationnaire');
     disp('--------------------------------------');
 end