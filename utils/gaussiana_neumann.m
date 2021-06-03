function [be] = gaussiana_neumann(msh, q, edge, n)
    %GAUSSIANA_NEUMANN resuelve la integral de la condicion de neumann
    %   msh : mesh generado con gmesh
    %   q : función que da el valor de la condición de neumann (dependiente de la posicion)
    %   edge : arista en la que se aplica la condicion neumann
    %   n : posicion de la arista
    
    N = @(pos_, xi_) (pos_ == 1) * (1 - xi_) + ...
                     (pos_ == 2) * (xi_);
    %
    XI = @(pos_) (pos_ == 1) * (1 - (1/sqrt(3)) ) / 2 + ...
                 (pos_ == 2) * (1 + (1/sqrt(3)) ) / 2;
    %
    w = 1/2;
                 
    rs = @(x1_, y1_, x2_, y2_, xi_) [x1_; y1_] + xi_*[(x2_ - x1_) ; (y2_ - y1_)];
    abs_rs = @(x1_, y1_, x2_, y2_) sqrt( (x2_ - x1_)^2 + (y2_ - y1_)^2 );
    
    x1 = msh.POS(edge(1), 1);
    y1 = msh.POS(edge(1), 2);
    x2 = msh.POS(edge(2), 1);
    y2 = msh.POS(edge(2), 2);
    
    be = 0;
    for i=1:2
        xi = XI(i);
        Nn = N(i, xi);
        
        xy = rs(x1,y1,x2,y2,xi);
        
        be = be + q(xy(1), xy(2)) * Nn * abs_rs(x1, y1, x2, y2) * w;
    end
    
end
