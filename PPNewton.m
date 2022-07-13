function [  ] = PPNewton( fx,dfx,x0,e )
saisothucte = 1;
step = 0;
while saisothucte > e
    step = step + 1;
    fx0 = feval(fx,x0);
    dfx0 = feval(dfx,x0);
    x = x0 - fx0/dfx0;
    saisothucte = abs(feval(fx,x));
    x0 = x;
end
Nghiem = x
sai_so = saisothucte
so_buoc_lap = step
end

