
# Resolución de la ecuación de Poisson en 2D mediante el método de los elementos finitos

En este repositorio se encuentra la implementación en Matlab de la resolución de la ecuación de Poisson en 2D mediante el método de los elementos finitos.

## Ejemplo de fichero de parámetros (params_cuadrado.m)

```Matlab

syms xt yt fsym(xt, yt)
diritchlet = containers.Map( 'KeyType', 'int32', 'ValueType', 'any' );
neumann = containers.Map( 'KeyType', 'int32', 'ValueType', 'any' );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARAMETROS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% inicializa mesh
cuadrado;

% Función f de la ecuación de poisson
% -v(u) = f

fsym(xt, yt) = 0;
%fsym(xt, yt) = exp(-(xt-0.5)^2 - (yt-0.5)^2);
%fsym(xt, yt) = 10*exp(-10*((xt-0.5)^2 + (yt-0.5)^2));


% Condiciones de contorno
% condition_type(label) = function
neumann(7) =  @(x_, y_) 2; % 1
neumann(9) =  @(x_, y_) -4; % 3

diritchlet(8) = @(x_, y_) 5; % 2
diritchlet(10) = @(x_, y_) 0; % 4

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARAMETROS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = matlabFunction(fsym);

```

## Utilización

1. Generar malla con *GMsh* y exportar a formato *Matlab*.
2. LLamada al script `mef2d`.
3. Pasar parámetros y nombre de fichero de salida.
```
Fichero de parámetros > ./parameters/params_cuadrado.m
Fichero de salida > ./solucion.inp
```
4. Visualizar salida con *ParaView*


## Referencias

- [GMsh: generador de malla](https://gmsh.info/)
- [Paraview: visualización de soluciones](https://www.paraview.org/)
