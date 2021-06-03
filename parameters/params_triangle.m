
syms xt yt fsym(xt, yt)
diritchlet = containers.Map( 'KeyType', 'int32', 'ValueType', 'any' );
neumann = containers.Map( 'KeyType', 'int32', 'ValueType', 'any' );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARAMETROS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% inicializa mesh
triangle;

% Función f de la ecuación de poisson
% -v(u) = f

fsym(xt, yt) = 0;
%fsym(xt, yt) = exp(-(xt-0.5)^2 - (yt-0.5)^2);
%fsym(xt, yt) = 10*exp(-10*((xt-0.5)^2 + (yt-0.5)^2));


% Condiciones de contorno
% condition_type(label) = function
diritchlet(4)  = @(x_, y_) 0;
diritchlet(5)  = @(x_, y_) 5;
diritchlet(6)  = @(x_, y_) -3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARAMETROS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = matlabFunction(fsym);
