function [xi, eta, w] = cuadratura(pos)
    %CUADRATURA Devuelve el valor de cuadratura y pesos para cada posición
    xi_eta = [1/6, 1/6
              2/3, 1/6
              1/6, 2/3];
    %
    xe = num2cell(xi_eta(pos, :));
    [xi, eta] = deal(xe{:});
    w = 1/6;
end
