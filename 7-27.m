f = @(x, y) -8*x + x.^2 + 12*y + 4*y.^2 - 2*x.*y;
%a) graphical
[X, Y] = meshgrid(linspace(-5, 5, 20), linspace(-5, 5, 20));
Z = f(X, Y);
surf(X, Y, Z)
view(0, 90)
xlabel('x')
ylabel('y')
zlabel('z')
colorbar
pause

%b) fminsearch
fnew = @(x) f(x(1), x(2));
[x,z] = fminsearch(fnew, [0,0])
%c) substitute b) into a)
fnew(x)

