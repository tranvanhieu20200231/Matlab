%cac du kien de bai cho
N=20; c=1; dx=0.05; dt=0.01; Time=5;
% Dieu kien can thiet
for i=1:N
    v(1,i)=0;
    v(N,i)=0;
    v(i,1)=sin(2*pi*(i-1)*dx);
end
to = c*dt/dx;
NTime=Time/dt;
for time=2:NTime-1
    for i=2:N-1
        v(i,time+1)=2*v(i,time)-v(i,time-1)+to*to*(v(i-1,time)-2*v(i,time)+v(i+1,time));
    end
    % Simulate
    X=1:N;
    plot(X,v(:,time));
    ylim([-25,25]);
    pause(0.1);
end