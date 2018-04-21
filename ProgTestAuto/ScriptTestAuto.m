


while(1)
disp('------------------------------------------------------')
  prompt=' Souhaitez vous resoudre des probl�mes d optimisation avec ou sans contraintes ? (a / s / b) : ';
  result=input(prompt, 's');
  switch result
    case 'a' %% Avec %%
      prompt='Voulez vous utiliser la fonction f1 ou f2 ? (f1/f2) : ';
      fonc=input(prompt,'s');
      if (fonc =='f1')
         testf1Lag;
      else
         testf2flag;
      end
    case 's'  %% Sans %%
      prompt='Voulez vous utiliser la fonction f1 ou f2 ? (f1/f2) : ';
      fonc=input(prompt,'s');
      ScriptChoixAlgo;
      if (resultAlg==1)
          if (fonc=='f1')
              test1
          else
              test2
          end
      else
        %%%%%%% resultAlg==2 %%%%%%%%%%% 
        ScripChoixReg;
        if (resultreg==1)
            if (fonc=='f1')
              testf1r
          else
              testf2r
          end
        else
             if (fonc=='f1')
              testRegConfMoref1
          else
              testRegConfMoref2
          end
        end
      end 
    case 'b'  %% Break %%
       break;
    otherwise
     disp('Commande incorrecte')
  end
end