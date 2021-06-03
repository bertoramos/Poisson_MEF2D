
syms xt yt fsym(xt, yt)
diritchlet = containers.Map( 'KeyType', 'int32', 'ValueType', 'any' );
neumann = containers.Map( 'KeyType', 'int32', 'ValueType', 'any' );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARAMETROS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% inicializa mesh
cuadrado;

% Función f de la ecuación de poisson
% -v(u) = f

fsym(xt, yt) = 0;

% Condiciones de contorno
% condition_type(label) = function
neumann(7) =  @(x_, y_) 2;
neumann(9) =  @(x_, y_) -4;

diritchlet(8) = @(x_, y_) 5;
diritchlet(10) = @(x_, y_) 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARAMETROS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = matlabFunction(fsym);
