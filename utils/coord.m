function [x, y, z] = coord(msh, elem_index, n)
    % COORD Devuelve las coordenadas del nodo n del elemento elem_index
    %   Detailed explanation goes here

    num_node = elem(msh, elem_index, n);
    [x,y,z] = node_coord(msh, num_node);
end