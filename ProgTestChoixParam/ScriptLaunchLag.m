
  prompt='Valeur de lambda_0 ? : ';
  l0=input(prompt);
  prompt='Point de d�part ? : ';
  x0=input(prompt);
  prompt='Sous algorithme a utiliser ? (1-> Newton Local, 2-> Reg+Cauchy, 3->Reg+More) : ';
  flag=input(prompt);
  while (flag~=1 && flag~=2 && flag~=3)
    prompt='Sous algorithme a utiliser ? (1-> Newton Local, 2-> Reg+Cauchy, 3->Reg+More) : ';
    flag=input(prompt);
  end

  prompt='Donnez un nombre d iterations max, delta_0, delta_max et un nombre max d iterations pour chaque sous partie : ';
  param=input(prompt);
  while (size(param,1)~=4)
      prompt='Donnez un nombre d iterations max, delta_0, delta_max et un nombre max d iterations pour chaque sous partie : ';
       param=input(prompt);
  end
  
  global mu0 nt0 a b;
  a=0.1;
  b=0.9;
  mu0=10;
  nt0=0.1258925;
  tho=1.01;

  flagsc=input('Voulez vous modifier les scalaires (mu0,tho, nt0, a et b )( Par defaut (10;1.01;0.1258925;0.1;0.9) ? (o/n) : ','s');
  if (flagsc=='o')
    scal =input('Valeurs pour (mu0,tho, nt0, a et b ) : ');
    while (size(scal,1)~=5)
      scal =input('Valeurs pour (mu0,tho, nt0, a et b ) : ');
    end
    mu0=scal(1);
    tho=scal(2);
    nto=scal(3);
    a=scal(4);
    b=scal(5);
    
  end

  [ xsol, lsol, musol, k, c_x, nb_intern ] = Lagrangien(flag,  x0, l0, f, h, grad_f, grad_h, hess_f, hess_h, param(1) , param(2), param(3), param(4),tho);
  scriptResultat
