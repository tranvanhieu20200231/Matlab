fx = @(x)x^.2+x+1;
Fx = @(x)x^.3/3+x.^2/2+x;
a = 1;b = 2;
fa = feval(fx,a);
fb = feval(fx,b);
ictht = (fa + fb)*(b-a)/2
