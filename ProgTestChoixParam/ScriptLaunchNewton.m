%%%%%% ScriptLaunchNewton


  prompt='Rentrez un epsilon et un nombre d iterations max ([a;b]) : ';
  param=input(prompt);
  while (size(param,1)~=2)
    prompt='Rentrez un epsilon et un nombre d iterations max ([a;b]) : ';
    param=input(prompt);
  end
  prompt2=' Point de depart ? : ';
  pointDep=input(prompt2);
  [ xs,nb_it, grad_f_xsol, neval ] = NewtonLocal(f,grad_f,hess_f,pointDep,param(1),param(2));
  scriptAffichageNL;

     %%%%%%% algorithme CHOISI %%%%%%%%%%%%%%