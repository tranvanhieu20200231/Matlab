fx = @(x)sin(x);
A = pi/3;
Chinh_xac = cos(A);
fprintf('h \t\t\t SPThuan \t\t SPNguoc \n');
for i = 1:6
    h = 1/10^i;
    Gan_dung_SPT = (feval(fx,A+h) - feval(fx,A))/h;
    Gan_dung_SPN = (feval(fx,A) - feval(fx,A-h))/h;
    fprintf('%f \t %f \t %f \n',h, Gan_dung_SPT,Gan_dung_SPN);
end