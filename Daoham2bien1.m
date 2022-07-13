fxy=@(x,y)X.^3+2*x*y.^2+1
hx = 0.01; hy = 0.02;
Nx = (1 - 0)/hx;
Ny = (2 - 1)/hy;
for i = 1:Nx
    X = 0+i*hx;
    for j = 1:Ny
        Y = 1+j*hy;
        SPTT(i) = (feval(fxy,0+(i+1)*hx,y) - feval(fxy,0+(i-1)*hx,y))/(2*hx);
        SPTT(j) = (feval(fxy,x,1+(i+1)*hy) - feval(fxy,x,1+(i-1)*hy))/(2*hy);
        surf(X,Y,SPTT(i),'r*');
        surf(X,Y,SPTT(j),'mo');
    end
end