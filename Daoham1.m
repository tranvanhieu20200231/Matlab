fx = @(x)sin(x);
A = pi/3;
Chinh_xac = cos(A);
fprintf('h \t\t\t DHGD \n');
for i = 1:6
    h = 1/10^i;
    Gan_dung = (feval(fx,A+h) - feval(fx,A))/h;
    fprintf('%f \t %f \n',h, Gan_dung);
end

