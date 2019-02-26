G=1; % m^3 kg^-1 s^-2
Ms=2; % kg
x=1; % m
y=0; % m
U=0; % m/s
V=sqrt(2); % m/s
tmax=50000; % s
clockmax=1000; % steps
dt=clockmax/tmax;
xsave=zeros(1,clockmax);
ysave=zeros(1,clockmax);
for clock=1:clockmax
    R=sqrt(x^2+y^2);
    U=U-dt*G*Ms*x/R^3;
    V=V-dt*G*Ms*y/R^3;
    x=x+dt*U;
    y=y+dt*V;
    xsave(clock)=x;
    ysave(clock)=y;
    plot(0,0,'r*',xsave,ysave)
    drawnow
end