 prompt='Rentrez un epsilon et un nombre d iterations max ([a;b]) : ';
 param=input(prompt);
 while (size(param,1)~=2)
    prompt='Rentrez un epsilon et un nombre d iterations max ([a;b]) : ';
    param=input(prompt);
  end
 prompts='Rentrez g1, g2, n1, n2, delta_0 et delta_max : ';
 scal=input(prompts);
 while (size(scal,1)~=6)
   prompts='Rentrez g1, g2, n1, n2, delta_0 et delta_max : ';
   scal=input(prompts);
 end
 prompt2=' Point de depart ? : ';
 pointDep=input(prompt2);

 [ngsol, nevals,nb_iter, xsol, f_xsol, delta_fin ] = regionsConf( f, grad_f, hess_f ,pointDep,param(2) ,scal(5), scal(6), scal(1),scal(2),scal(3),scal(4),param(1) );
 ScriptAffReg;
