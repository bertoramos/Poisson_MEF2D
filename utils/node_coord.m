function [x, y, z] = node_coord(msh, num_node)
    %NODE_COORD Devuelve coordenadas de un nodo
    %   msh : mesh generado por gmsh
    %   node_idx : índice del nodo elegido
    
    if num_node > size(msh.TRIANGLES, 1)
        throw(MException('d_fforma:BadIndex', "Índice de elemento fuera de rango (" + size(msh.TRIANGLES, 1) + " triángulos en el mesh)")); 
    end
    
    xyz = msh.POS(num_node, :);
    [x, y, z] = deal(xyz(1), xyz(2), xyz(3));
end

