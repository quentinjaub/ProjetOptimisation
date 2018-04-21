disp('---------------------------------------')
if (str=='f2')
    disp('Fontion à minimiser : f2')
    disp('Contrainte : x(1)²+x(3)²-1.5 ')
else
    disp('Fontion à minimiser : f1');
    disp('Contrainte : x(1)+x(3)-1 ');
end
disp('---------------------------------------')
if (flag==1)
    disp('Methode : Region de confiance + More');
elseif(flag==2)
    disp('Methode : Region de confiance +Cauchy')
else
    disp('Methode : Newton Local');
end
disp('---------------------------------------')
disp('Point de depart : X0 =')
disp(x0)