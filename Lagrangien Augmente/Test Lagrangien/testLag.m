function [k] = testLag(flag,  x0, l0, f, c, grad_f, deriv_c, hess_f, d2c, nb_max,delta_0, delta_max, nbmax_sp, str,t )



[ xsol, lsol, musol, k, c_x , nb_intern] = Lagrangien(flag,  x0, l0, f, c, grad_f, deriv_c, hess_f, d2c, nb_max,delta_0, delta_max, nbmax_sp,t );
scriptResultat

