function [  ] = PPCatTuyen( fx,x0,x1,e )
saisothucte = 1;
step = 0;
while saisothucte > e
    step = step + 1;
    fx0 = feval(fx,x0);
    fx1 = feval(fx,x1);
    dfx1 = (fx1 - fx0)/(x1 - x0);
    x2 = x1 - fx1/dfx1;
    saisothucte = abs(feval(fx,x2));
    x0 = x1;
    x1 = x2;
end
Nghiem = x2
sai_so = saisothucte
so_buoc_lap = step
end
