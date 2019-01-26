f = @(x, y) -8*x + x.^2 + 12*y + 4*y.^2 - 2*x.*y;
%a) graphical
[X, Y] = meshgrid(linspace(-5, 5, 20), linspace(-5, 5, 20));
Z = f(X, Y);
surf(X, Y, Z)
colorbar
pause

%b) fminsearch

%c) substitute b) into a)
