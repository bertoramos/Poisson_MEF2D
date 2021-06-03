function [n] = fforma(pos, xi, eta)
    %FFORMA Función de forma
    %   pos : nodo al que hace referencia en el elemento
    %   xi : valor xi de la función
    %   eta : valor eta de la función
    
    forma = { @ (xi_, eta_) 1 - xi_ - eta_
              @ (xi_, eta_) xi_
              @ (xi_, eta_) eta_ };
    %
    
    fun = cell2mat(forma(pos,1));
    n = fun(xi, eta);
end
