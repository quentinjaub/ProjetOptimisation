%% Choix fonction
boolf=0;
%%%%%%% CHOIX CONTRAINTE  %%%%%%%%%%%%%%
      while (boolf==0)
        prompt='Contrainte h1 ou h2 ? (h1 pour f1, h2 pour f2) : ';
        fonc=input(prompt,'s');
        switch fonc
          case 'h1'
            [h, grad_h, hess_h]=contrainte(1);
            boolf=1;
          case 'h2'
            [h, grad_h, hess_h]=contrainte(2);
            boolf=1;
          otherwise
        end
      end
%%%%%%% CONTRAINTE CHOISIE %%%%%%%%%%%%%%