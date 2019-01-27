D = @(sig, W, V) 0.01*sig.*V.^2 + 0.95./sig.*(W./V).^2;

%a) 
Dnew = @(V) D(0.6, 16000, V);
[voptimal, mindrag] = fminsearch(Dnew, 10)

%b)
wrange = linspace(12000, 20000, 1000);
Dnewb = @(W) D(0.6, W, voptimal)
plot(wrange, Dnewb(wrange))
pause
