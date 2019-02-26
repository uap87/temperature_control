G=6.673889E-11; % m^3 kg^-1 s^-2
Ms=1.9891E30; % kg
Rs=696000000; % m
tempS=5800;
% x=1.2466E11; % ellipse 1
x=149597870000; % m regular
y=0; % m
U=0; % m/s
% V=35235; % ellipse 1
V=29788*1.2; % m/s regular
% V=24122; % m/s velocity of mars
tmax=1; % s
clockmax=317; % steps
% clockmax=100000; % steps
dt=100000/tmax;
xsave=zeros(1,clockmax);
ysave=zeros(1,clockmax);
tsave=zeros(1,clockmax);
tempEsave = zeros(1,clockmax);
for clock=1:clockmax
%     if y<0
%         clock
%     end
    R=sqrt(x^2+y^2);
    U=U-dt*G*Ms*x/R^3;
    V=V-dt*G*Ms*y/R^3;
    x=x+dt*U;
    y=y+dt*V;
    tempE = tempS*sqrt(Rs/(2*R));
    xsave(clock)=x;
    ysave(clock)=y;
    tsave(clock)=clock*dt;
    tempEsave(clock)=tempE;
    figure(1)
    plot(0,0,'r*',xsave,ysave)
    axis equal
    drawnow
    figure(2)
    plot(tsave,tempEsave)
    drawnow
end
total_temp=0;
for counter = 1:clockmax
    total_temp = total_temp+tempEsave(counter);
end
% total_entries = size(tempEsave);
average_temp = total_temp/clockmax
% G=1; % m^3 kg^-1 s^-2
% Ms=2; % kg
% x=1; % m
% y=0; % m
% U=0; % m/s
% V=sqrt(2); % m/s
% tmax=50000; % s
% clockmax=1000; % steps
% dt=clockmax/tmax;
% xsave=zeros(1,clockmax);
% ysave=zeros(1,clockmax);
% for clock=1:clockmax
%     R=sqrt(x^2+y^2);
%     U=U-dt*G*Ms*x/R^3;
%     V=V-dt*G*Ms*y/R^3;
%     x=x+dt*U;
%     y=y+dt*V;
%     xsave(clock)=x;
%     ysave(clock)=y;
%     plot(0,0,'r*',xsave,ysave)
%     drawnow
% end