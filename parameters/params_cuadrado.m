
syms xt yt fsym(xt, yt)
diritchlet = containers.Map( 'KeyType', 'int32', 'ValueType', 'any' );
neumann = containers.Map( 'KeyType', 'int32', 'ValueType', 'any' );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARAMETROS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% inicializa mesh
cuadrado;

% Función f de la ecuación de poisson
% -v(u) = f
fsym(xt, yt) = 0;
%fsym(xt, yt) = exp(-(xt-0.5)^2 - (yt - 0.5)^2);
%fsym(xt, yt) = exp(-(xt-0.5)^2 - (yt-0.5)^2);
%fsym(xt, yt) = 10*exp(-10*((xt-0.5)^2 + (yt-0.5)^2));


% Condiciones de contorno
% condition_type(label) = function
diritchlet(7) =  @(x_, y_) 0; % 1
diritchlet(8) = @(x_, y_) 1;
diritchlet(9) = @(x_, y_) 1;
diritchlet(10) = @(x_, y_) 1;
%neumann(9) =  @(x_, y_) -4; % 3

%diritchlet(8) = @(x_, y_) 5; % 2
%diritchlet(10) = @(x_, y_) 0; % 4

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARAMETROS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = matlabFunction(fsym);
