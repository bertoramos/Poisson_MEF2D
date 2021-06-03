function [be] = gauss_referencia_poisson_B(msh, elem, f)
    %GAUSS_REFERENCIA_POISSON_B Resuelve integrales para poisson
    
    Te = @(J, x1_, x2_, chi_, eta_) [x1_ ; x2_] + J*[chi_; eta_];
    
    be = 0;
    for i=[1,2,3]
        [chi_i, eta_i, w_i] = cuadratura(i);
        J = jacobiano(msh, elem);
        
        [x_i, y_i, ~] = coord(msh, elem, i);
        
        xy = Te(J, x_i, y_i, chi_i, eta_i);
        x = xy(1);
        y = xy(2);
        
        fu = f(x,y);
        
        be = be + fu * fforma(i, chi_i, eta_i) * det(J) * w_i;
        
    end
    
end

