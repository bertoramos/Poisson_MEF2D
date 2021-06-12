function [u] = solver_mef_2d(msh, diritchlet, neumann, num_elems, f)
    %MEF_2D Resuelve ecuación de poisson en 2D
    %   msh : mesh generado con gmesh
    %   diritchlet : condiciones iniciales de contorno tipo diritchlet
    %   neumann : condiciones iniciales de contorno tipo neumann
    %   num_elems : numero de elementos en el mesh
    nnodes = msh.nbNod;
    
    u = [];
    
    K = sparse(nnodes, nnodes);
    B = sparse(nnodes, 1);
    
    % Genera matriz y vector
    for e=1:num_elems
        for n=1:3
            for m=1:3
                
                ke = gauss_referencia_poisson_K(msh, e, m, n);
                
                i = elem(msh, e, n);
                j = elem(msh, e, m);
                
                K(i, j) = K(i, j) + ke;
            end
            be = gauss_referencia_poisson_B(msh, e, f);
            
            
            i = elem(msh, e, n);
            
            B(i) = B(i) + be;
        end
    end
    
    
    global G
    
    % Añade condiciones de contorno
    for edgei=1:size(msh.LINES, 1)
        edge = msh.LINES(edgei, :); % arista
        label = edge(3); % etiqueta puesta la linea
        
        % Condiciones Diritchlet
        if isKey(diritchlet, label)
            value = diritchlet(label);
            
            for node=edge(1:2)
                x = msh.POS(node, 1);
                y = msh.POS(node, 2);

                K(node, node) = G;
                B(node) = B(node) + G*value(x,y);
            end
        end
        
        % Condiciones Neumann
        if isKey(neumann, label)
            value = neumann(label);
            
            for n=edge(1:2)
                be = gaussiana_neumann(msh, value, edge, n);
                B(n) = B(n) + be;
            end
        end
        
    end
    
    % Resuelve sistema de ecuaciones
    u = full(K\B);
    
end
