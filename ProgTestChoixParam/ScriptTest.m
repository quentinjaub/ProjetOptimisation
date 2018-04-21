


while(1)
disp('------------------------------------------------------')
  prompt=' Souhaitez vous resoudre des problèmes d optimisation avec ou sans contraintes ? (a / s / b) : ';
  result=input(prompt, 's');
  switch result
    case 'a'
      ScriptChoixFonction;
      ScripChoixContrainte;
      ScriptLaunchLag
    case 's'
      ScriptChoixFonction;
      ScriptChoixAlgo;
      if (resultAlg==1)
        ScriptLaunchNewton
      else
        %%%%%%% resultAlg==2 %%%%%%%%%%% 
        ScripChoixReg;
        if (resultreg==1)
          ScriptLaunchCauchy
        else
          ScriptLaunchMore
        end
      end 
    case 'b'
       break;
    otherwise
     disp('Commande incorrecte')
  end
end