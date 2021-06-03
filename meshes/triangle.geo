// Gmsh project created on Mon May 03 12:38:44 2021
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0, 0.05};
//+
Point(2) = {1, 0, 0, 0.05};
//+
Point(3) = {0.5, 1, 0, 0.05};
//+
Line(1) = {1, 2};
//+
Line(2) = {3, 2};
//+
Line(3) = {3, 1};
//+
Curve Loop(1) = {2, -1, -3};
//+
Plane Surface(1) = {1};
//+
Physical Curve(4) = {1};
//+
Physical Curve(5) = {2};
//+
Physical Curve(6) = {3};
//+
Physical Surface(7) = {1};
