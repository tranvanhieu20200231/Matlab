%% Clear
clear
clc
%% Khai bao
g=9.81; vWave = 3; Lx=300; Ly=300; nx=201; ny=201;
dx=Lx/(nx-1);
dy=Ly/(ny-1);
height = 2; k = 5; r = 3e-5;
[x y] = meshgrid(linspace(0,Lx,nx),linspace(0,Ly,ny));
eta=zeros(nx,ny);
u=zeros(nx,ny);
v=zeros(nx,ny);
etap=zeros(nx,ny);
up=zeros(nx,ny);
vp=zeros(nx,ny);
etam=zeros(nx,ny);
um=zeros(nx,ny);
vm=zeros(nx,ny);
wall = zeros(nx,ny);
%% Doc du lieu tu file
f = fopen('Data/File4.txt','r');
luongmua = fscanf(f,"Luongmua %d\n");
slwall = fscanf(f,"SLWall %d\n");
dMode = fscanf(f,"Tatdan %d\n");
rMode = fscanf(f,"RMODE %d\n");
if (rMode)
    step = fscanf(f,'%d\n');
end
%% So luong song tao ra
for ii = 1:luongmua
    tmp = fscanf(f,'Mua_ID %d %d %d\n',[3 1]);
    x0 = tmp(2);
    y0 = tmp(3);
    for i=1:nx 
        for j=1:ny
            if (wall(i,j))
                etam(i,j) = 0;
            else
                etam(i,j) = etam(i,j) + 10*exp((-((i-x0)^2 + (j-y0)^2))/(k^2));
            end
       
        end
    end
end
%% Vat can
for ii = 1:slwall
    tmp = fscanf(f,'WALL_ID %d %d %d %d %d\n',[5 1]);
    type = tmp(2);
    uu = tmp(3);
    vv = tmp(4);
    ww = tmp(5);
    if (type==0)
        wall(vv:ww,uu) = height;
    else
        wall(uu,vv:ww) = height;
    end
end

eta=etam;

surf(x,y,eta)
view(30,90)
%% Tinh chat cua song
dt=1/30; Nsteps=5000; rt = 0; damp = 1; accT = 0; n = 0;
speed = 3; ds2 = 0.1;
while n<Nsteps
    if (dMode)
        if (rt<2e-2)
            rt = rt + dt*r;
            damp = exp(-rt);
        end
    end
    for i=2:nx-1
        if (not(wall(i,1)))
            eta(i,1) = eta(i,3);
        end
        if (not(wall(i,ny)))
            eta(i,ny) = eta(i,ny-2);
        end
    end
    for i=2:ny-1
        if (not(wall(1,i)))
            eta(1,i) = eta(3,i);
        end
        if (not(wall(nx,i)))
            eta(nx,i) = eta(nx-2,i);
        end
    end
    
    for i=2:nx-1
        for j=2:ny-1
            if (wall(i,j))
                continue;
            end
            etap(i,j)=(2*eta(i,j)-etam(i,j)+(ds2)*...
            (eta(i+1,j)+eta(i-1,j)+eta(i,j+1)+eta(i,j-1)-4*eta(i,j)))*damp;
        end
    end
    etam=eta;
    eta=etap;
    accT = accT + 1;
    if (accT<speed)
        continue;
    end
    accT = 0;
    if (rMode && mod(n,step)==0)
        while 1
            x0 = randi([1 nx],1,1);
            y0 = randi([1 ny],1,1);
            if (not(wall(x0,y0))) 
                break;
            end
        end
        for i=1:nx 
            for j=1:ny
                if (wall(i,j))
                    eta(i,j) = 0;
                else
                    dist = (i-x0)^2+(j-x0)^2; 
                    etam(i,j) = etam(i,j) - 5*exp((-((i-x0)^2 + (j-y0)^2))/(k^2));
                    eta(i,j) = eta(i,j) - 5*exp((-((i-x0)^2 + (j-y0)^2))/(k^2));
                end
       
            end
        end
    end
    f = figure(1);
    u = eta + wall;
    surf(x,y,u)
    colormap('summer')
    zlim([-5 5])
    view(45,60)
    shading interp
      n = n + 1;
end