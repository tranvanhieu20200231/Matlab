function [ ] = PPLap( gx,x0,e )
saisothucte = 1;
step = 0;
while saisothucte > e
    step = step + 1;
    x = feval(gx,x0);
    saisothucte = abs(x-x0);
    x0=x;
    
end
Nghiem = x
so_buoc_lap = step
end