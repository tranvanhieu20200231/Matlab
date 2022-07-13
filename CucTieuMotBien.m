function [] = CucTieuMotBien(F, a, b, eps)
    while abs(b-a)>=2*eps
        x1=a + (b-a)/2 - eps/2; 
        x2=a + (b-a)/2 + eps/2;
        f1=feval(F,x1); 
        f2=feval(F,x2); 
        if f1<f2 b=x2;
            elseif f1>f2 a=x1;
            else a=x1;b=x2;
        end
    end
    ab = (a + b) / 2;
    fprintf('Minimal point is x = %f\n', ab);
    fprintf('Minimal value is fx = %f\n', feval(F, ab));
end


