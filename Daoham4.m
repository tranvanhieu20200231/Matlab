fx = @(x)sin(x);
h = 0.05;
N = (pi - pi/2)/h;
A = pi/2:h:pi;
Chinh_xac = cos(A);
plot(A,Chinh_xac); hold on;
for i = 1:N
    X = pi/2+i*h;
    SPT(i) = (feval(fx,pi/2+(i+1)*h) - feval(fx,pi/2+i*h))/h;
    SPN(i) = (feval(fx,pi/2+i*h) - feval(fx,pi/2+(i-1)*h))/h;
    SPTT(i) = (feval(fx,pi/2+(i+1)*h) - feval(fx,pi/2+(i-1)*h))/(2*h);
    plot(X,SPT(i),'r*');
    plot(X,SPN(i),'mo');
    plot(X,SPTT(i),'r+');
end
