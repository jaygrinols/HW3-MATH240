D = @(sig, W, V) 0.01*sig.*V.^2 + 0.95./sig.*(W./V).^2;

%a) 
Dnew = @(V) D(0.6, 16000, V);
t = linspace(0, 10);
plot(t, Dnew(t))
title('test')
pause
