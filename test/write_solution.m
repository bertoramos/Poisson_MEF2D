function [flag] = write_solution(msh, u, solution_name)
    flag = false;
    
    
    [pathstr, name, ext] = fileparts(solution_name);
    
    if isempty(pathstr) || pathstr == ""
        pathstr = ".";
    end
    
    if isempty(name) || name == ""
        name = "solucion";
    end
    
    if isempty(ext) || ext == ""
        ext = ".inp";
    end
    
    fname = fullfile(pathstr, name+ext);
    
    fid = fopen(fname, "w");
    if fid < 0
        return
    end
    nnodes = msh.nbNod;
    ntri = size(msh.TRIANGLES, 1);
    
    % write header
    fprintf(fid, "%d %d %d %d %d\n", nnodes, ntri, 1, 0, 0);
    
    for i=1:nnodes
        xyz = msh.POS(i, :);
        fprintf(fid, "%d ", i);
        fprintf(fid, "%g %g %g\n", xyz(1), xyz(2), xyz(3));
    end
    
    for i=1:ntri
        pos1 = msh.TRIANGLES(i, 1);
        pos2 = msh.TRIANGLES(i, 2);
        pos3 = msh.TRIANGLES(i, 3);
        
        fprintf(fid, "%d 1 tri %g %g %g\n", i, pos1, pos2, pos3);
        
    end
    
    fprintf(fid, "1 1\n");
    fprintf(fid, "v, vol\n");
    
    for i=1:nnodes
        fprintf(fid, "%g %g\n", i, u(i));
    end
    
    if fclose(fid) == 0
        flag = true;
        return;
    end
end
