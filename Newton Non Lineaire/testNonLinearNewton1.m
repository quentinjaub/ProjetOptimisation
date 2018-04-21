a1=2;
a2=-38;
b1=20;
b2=20;
delta=0.8;

[ phi, derivee_phi ] = fonctionNonLinear(a1, a2, b1, b2, delta);

%%
eps=1e-6;
lmin=-100;
lmax= -40;
k_max=1e6;

%%lsol et lsolinv / phi(lsol)=0 et invphi(lsol)=0
 [ lsol , k, phi_lsol, neval ] = NoLinearNewton( phi,derivee_phi, eps, lmin, lmax , k_max)
%[ lsolinv , kinv] = NoLinearNewton( invphi,derivee_invphi, eps, lmin, lmax , k_max)