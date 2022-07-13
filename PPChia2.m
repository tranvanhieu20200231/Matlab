function [  ] = PPChia2( fx,a,c,e )
    saisothucte = 10000000;
    step = 0;
while saisothucte>e
    b=(a+c)/2;
    step = step + 1;
    fa=feval(fx,a);
    fb=feval(fx,b);
    fc=feval(fx,c);
    fprintf('%d \t %f \t %f \t %f \t %f \t %f \t %f\n',step,a,b,c,fa,fb,fc);
    if (fa*fb) <= 0
        c = b;
    else
        a = b;
    end
    saisothucte = abs(fb);
end