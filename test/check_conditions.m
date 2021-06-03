function check_conditions(msh, diritchlet, neumann)
%CHECK_CONDITIONS Testea que las condiciones iniciales de contorno sean válidas
%throw(MException('d_fforma:BadIndex', "")); 
    labels = unique(msh.LINES(:, 3))';
    num_cont = size(labels, 2);
    
    if diritchlet.Count + neumann.Count ~= num_cont
        throw(MException('d_fforma:BadIndex', "Se esperaban " + num_cont + " condiciones"));
    end
    
    marked_labels = sort([cell2mat(diritchlet.keys) cell2mat(neumann.keys)]);
    compare_labels = marked_labels == labels;
    
    if sum(compare_labels) ~= num_cont
        pos = mat2str(find(compare_labels == 0));
        msg = "Etiqueta/s en la/s fila/s " + pos + " no válida/s";
        throw(MException('d_fforma:BadIndex', msg));
    end
    
end

