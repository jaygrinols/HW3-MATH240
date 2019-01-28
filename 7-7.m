f = @(x) -(4*x - 1.8*x.^2+1.2*x.^3 - 0.3*x.^4);

%a)Golden-section search
[xa, fa] = goldmin(f, -2, 4, 1)

%b)Parabolic Interpolation
[xb, fb] = parabmin2(f, 1.75, 2, 2.5, [], 5)
