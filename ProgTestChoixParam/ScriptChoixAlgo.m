%% Choix algo
boolf=0;
resultAlg=0;
%%%%%%% CHOIX algorithme  %%%%%%%%%%%%%%
      while (boolf==0)
       prompt='Quel algorithme choisissez vous ? (n/r) : ';
       alg=input(prompt,'s');
        switch alg
          case 'n'
            resultAlg=1;
            boolf=1;
          case 'r'
            resultAlg=2;
            boolf=1;
          otherwise
          
        end
      end
     %%%%%%% algorithme CHOISI %%%%%%%%%%%%%%