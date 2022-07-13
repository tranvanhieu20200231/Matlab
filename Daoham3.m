fx = @(x)sin(x);
A = pi/3;
Chinh_xac = cos(A);
fprintf('h \t\t\t SPThuan \t SPNguoc \t SPTrungTam \n');
for i = 1:6
    h = 1/10^i;
    SPT = (feval(fx,A+h) - feval(fx,A))/h;
    SPN = (feval(fx,A) - feval(fx,A-h))/h;
    SPTT = (feval(fx,A+h) - feval(fx,A-h))/(2*h);
    fprintf('%f \t %f \t %f \t %f \n',h, SPT,SPN, SPTT);
end