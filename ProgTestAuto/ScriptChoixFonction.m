%% Choix fonction
boolf=0;
%%%%%%% CHOIX FONCTION  %%%%%%%%%%%%%%
      while (boolf==0)
        prompt='Voulez vous utiliser la fonction f1 ou f2 ? (f1/f2) : ';
        fonc=input(prompt,'s');
        switch fonc
          case 'f1'
            [f, grad_f, hess_f]=f1();
            boolf=1;
          case 'f2'
            [f, grad_f, hess_f]=f2();
            boolf=1;
          otherwise
        end
        disp(['Fonction utilisee :',fonc]);
      end
     %%%%%%% FONCTION CHOISIE %%%%%%%%%%%%%%