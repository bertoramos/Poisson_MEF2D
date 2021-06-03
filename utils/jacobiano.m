function [J] = jacobiano(msh, elem_index)
    %JACOBIANO Retorna matriz jacobiana en el elemento elem_index
    %   msh : mesh generado por gmsh
    %   elem_index : indice del elemento
    
    [x1, y1, ~] = coord(msh, elem_index, 1);
    [x2, y2, ~] = coord(msh, elem_index, 2);
    [x3, y3, ~] = coord(msh, elem_index, 3);
    
    J = [x2 - x1, x3 - x1
         y2 - y1, y3 - y1];
    %
end

