function [n] = d_fforma(pos, ~, ~)
    %D_FFORMA Derivada de la funcion de forma
    %   pos : nodo al que hace referencia en el elemento
    %   xi : valor xi de la función (ignored - for readability purpose)
    %   eta : valor eta de la función de forma (ignored - for readability purpose)
    
    der = [-1 -1
            1  0
            0  1];
    %
    
    % retorna vector columna
    n = der(pos, :)';
end
