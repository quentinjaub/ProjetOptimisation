%% Choix algo
boolf=0;

%%%%%%% CHOIX algorithme  %%%%%%%%%%%%%%
      while (boolf==0)
       prompt='pas de Cauchy ou More-Sorensen ? (c/m) :';
       alg=input(prompt, 's');
        switch alg
          case 'c'
            resultreg=1;
            boolf=1;
          case 'm'
            resultreg=2;
            boolf=1;
          otherwise
           disp(' Rentrez cauchy ou more ');
        end
      end
  %%%%%%% algorithme CHOISI %%%%%%%%%%%%%%