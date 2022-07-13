x = 0:.5:100; y = x; [X,Y] = meshgrid(x,y);
F = []; F(1:length(x),1:length(y)) = 0;
t = 0; t0 = 1/2;
A = 0.1; L = 3; w = 2*pi/L; S = 1; Phi = pi/2;
wt = S*2*pi/L;
x0 = 50; y0 = 50; H0 = 0;
Arr = []
while 1
    tic
    for i = 1:length(x)
        for j = 1:length(y)
            d = dist(x(i),y(j),x0,y0);
            if (d/S>t)
                F(i,j) = H0;
            else
                F(i,j) = H0 + A*cos(w*d+t*wt+Phi);
            end
        end
    end
    t1 = toc;
    times = t1 / t0;
    delta_t = (times + 1)*t0 - t1;
    pause(delta_t);
    t = t + (times+1)*t0;
    surfl(F);
    zlim([-1 1]);
    view(30,60);
    colormap cool;
    shading interp;
end
    
function f = dist(x,y,x0,y0)
    f = sqrt((x-x0)^2+(y-y0)^2);
end