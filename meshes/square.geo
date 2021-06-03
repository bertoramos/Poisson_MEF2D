// Gmsh project created on Fri Apr 02 19:59:46 2021
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 1, 0.05};
//+
Point(2) = {0, 1, 1, 0.05};
//+
Point(3) = {1, 0, 1, 0.05};
//+
Point(4) = {1, 1, 1, 0.05};//+
Line(1) = {2, 4};
//+
Line(2) = {4, 3};
//+
Line(3) = {3, 1};
//+
Line(4) = {1, 2};
//+
Physical Curve(5) = {4};
//+
Physical Curve(6) = {1};
//+
Physical Curve(7) = {2};
//+
Physical Curve(8) = {3};
//+
Curve Loop(1) = {4, 1, 2, 3};
//+
Plane Surface(1) = {1};
//+
Physical Surface(9) = {1};
