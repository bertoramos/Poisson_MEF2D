%  Matlab mesh
% square, Created by Gmsh
% ASCII
clear msh;
msh.nbNod = 12;
msh.POS = [
0 0 1;
0 1 1;
1 0 1;
1 1 1;
0.5 1 1;
1 0.5 1;
0.5 0 1;
0 0.5 1;
0.25 0.75 1;
0.625 0.625 1;
0.71875 0.2812499999999999 1;
0.345703125 0.345703125 1;
];
msh.MAX = max(msh.POS);
msh.MIN = min(msh.POS);
msh.LINES =[ % pos(1) pos(2) label
 2 5 6
 5 4 6
 4 6 7
 6 3 7
 3 7 8
 7 1 8
 1 8 5
 8 2 5
];
msh.TRIANGLES =[ % pos(1) pos(2) pos(3) label
 4 10 5 9
 6 10 4 9
 1 12 7 9
 8 12 1 9
 3 11 6 9
 7 11 3 9
 5 9 2 9
 2 9 8 9
 10 12 9 9
 9 12 8 9
 5 10 9 9
 11 12 10 9
 7 12 11 9
 6 11 10 9
];
