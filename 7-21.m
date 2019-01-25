y = @(x, theta, vinit, g, yinit) tan(theta).*x - g./(2.*vinit.^2.*(cos(theta)).^2).*x.^2 + yinit;
f = @(x) y(x, 45*pi/180, 20, 9.81, 2);
goldmin(f,10, 30, 10)
