function [] = CT_HTMR(fx, a, b, n)
fa = feval(fx, a);
fb = feval(fx, b);
h=(b-a)/n;
sum=0;
for k=1:1:n-1
  x(k)=a+k*h;
  y(k)=feval(fx, x(k));
  sum=sum+y(k);
end
answer=h/2*(fa + fb + 2*sum);
fprintf('\n The value?is %f\n',answer); 
end

