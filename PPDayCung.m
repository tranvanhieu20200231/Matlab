function [  ] = PPDayCung( fx,a,c,e )
    saisothucte = 10000000;
    step = 0;
while saisothucte>e
    step = step + 1;
    fa=feval(fx,a);  
    fc=feval(fx,c);
    b=(a*fc-c*fa)/(fc-fa); 
    fb=feval(fx,b);
    fprintf('%d \t %f \t %f \t %f \t %f \t %f \t %f\n',step,a,b,c,fa,fb,fc);
    if (fa*fb) <= 0
        c = b;
    else
        a = b;
    end
    saisothucte = abs(fb);
end
end
