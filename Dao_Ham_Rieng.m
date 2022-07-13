function [] = Dao_Ham_Rieng(fxy, x, y)
h = .000001;
z = feval(fxy,x,y);
x1 = x + h * x;
y1 = y + h * y;
zx = feval (fxy,x1,y);
zy = feval(fxy,x,y1);
del_fx = (zx-z)/(h*x);
del_fy = (zy-z)/(h*y);
fprintf('Dao ham rieng tai x = %f & y = %f duoc dao ham rieng tai x la is %f & va y is %f \n',x,y,del_fx,del_fy );
end

