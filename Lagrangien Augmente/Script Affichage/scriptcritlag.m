disp('-------------------------------------');
disp( 'Cause d arret :');
if(flagSortie==0)
    disp('Nombre d iterations max');
elseif(flagSortie==1)
    disp('Norme du gradient proche de 0 et contrainte en xsol est nulle');
else
    disp('suite stationnaire');
end
disp('-------------------------------------');