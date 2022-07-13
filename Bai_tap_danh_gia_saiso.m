f = @(y,t)-y+t+1;
y0 = 1;
t0 = 0; t1 = 1;
h = 0.01;
%Chinh xac
y_chinhxac = @(t)t+exp(-t);
X = t0:h:t1;
Y_cx = feval(y_chinhxac,X);
plot(X,Y_cx); hold on;
fprintf('t \t\t\t Saiso\n');
%Forward Euler
fprintf('Forward Euler\n');
for t=t0:h:t1;
    Y_cx = feval(y_chinhxac,t);
    Y = y0 + h*feval(f,y0,t);
    plot(t,y0,'ro');
    y0 = Y;
    ss1 = abs(Y - Y_cx);
    fprintf('%f \t %f \n',t,ss1);
end
%Runge Kutte Bac 2
y0 = 1;
fprintf('Runge Kutte Bac 2\n');
for t=t0:h:t1;
    Y_cx = feval(y_chinhxac,t);
    k1 = h*feval(f,y0,t);
    k2 = h*feval(f,y0+k1,t+h);
    Y = y0 + 0.5*(k1 + k2);
    plot(t,y0,'bo');
    y0 = Y;
    ss2 = abs(Y - Y_cx);
    fprintf('%f \t %f \n',t,ss2);
end
%Runge Kutte Bac 3
fprintf('Runge Kutte Bac 3\n');
y0 = 1;
for t=t0:h:t1;
    Y_cx = feval(y_chinhxac,t);
    k1 = h*feval(f,y0,t);
    k2 = h*feval(f,y0+0.5*k1,t+0.5*h);
    k3 = h*feval(f,y0-k1+2*k2,t+h);
    Y = y0 + (k1 + 4*k2 + k3)/6;
    plot(t,y0,'go');
    y0 = Y;
    ss3 = abs(Y - Y_cx);
    fprintf('%f \t %f \n',t,ss3);
end
%Runge Kutte Bac 4
fprintf('Runge Kutte Bac 4\n');
y0 = 1;
for t=t0:h:t1;
    Y_cx = feval(y_chinhxac,t);
    k1 = h*feval(f,y0,t);
    k2 = h*feval(f,y0+0.5*k1,t+0.5*h);
    k3 = h*feval(f,y0+0.5*k2,t+0.5*h);
    k4 = h*feval(f,y0+k3,t+h);
    Y = y0 + (k1 + 2*k2 + 2*k3 + k3)/6;
    plot(t,y0,'yo');
    y0 = Y;
    ss4 = abs(Y - Y_cx);
    fprintf('%f \t %f \n',t,ss4);
end