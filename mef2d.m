clc;
clear;
close all;

addpath('./meshes');
addpath('./utils');
addpath('./test');

param_file = input("Fichero de parámetros > ", "s");
output_file = input("Fichero de salida (default: ./solucion.inp) > ", "s");

run(param_file);

% Comprueba entrada
check_conditions(msh, diritchlet, neumann);

% Parametros generales
NElems = size(msh.TRIANGLES, 1);
global G
G = eps^-1;

% Resuelve MEF
u = solver_mef_2d(msh, diritchlet, neumann, NElems, f);

% Escribe la solucion
write_solution(msh, u, output_file);

rmpath('./meshes');
rmpath('./utils');
rmpath('./test');
