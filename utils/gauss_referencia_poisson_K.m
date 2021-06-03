function [ke] = gauss_referencia_poisson_K(msh, elem, n, m)
    %GAUSS_REFERENCIA_POISSON_K Resuelve integrales para poisson
    J = jacobiano(msh, elem);
    Jti = (J^-1)';
    
    Nn = d_fforma(n);
    Nm = d_fforma(m);
    
    ke = (det(J)/2) * (Jti * Nn)' * (Jti * Nm) ;
end
