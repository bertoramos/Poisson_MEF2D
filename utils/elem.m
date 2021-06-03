function [num_node] = elem(msh, elem_index, n)
    if n > 3 || n < 1
        throw(MException('d_fforma:BadIndex', "Se esperaba un índice entre 1 y 3 (el elemento es un triángulo)")); 
    end
    if elem_index > size(msh.TRIANGLES, 1)
        throw(MException('d_fforma:BadIndex', "Índice de elemento fuera de rango (" + size(msh.TRIANGLES, 1) + " triángulos en el mesh)")); 
    end
    
    num_node = msh.TRIANGLES(elem_index, n);
end

