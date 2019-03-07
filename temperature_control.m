% % Orbit 1: Control
% G=6.673889E-11; % m^3 kg^-1 s^-2
% Ms=1.9891E30; % kg
% Rs=696000000; % m
% tempS=5800;
% x=149597870000; % m regular
% y=0; % m
% U=0; % m/s
% V=29788; % m/s regular
% tmax=1; % s
% clockmax=317; % steps
% dt=100000/tmax;

% % Orbit 2: Velocity Increases
% G=6.673889E-11; % m^3 kg^-1 s^-2
% Ms=1.9891E30; % kg
% Rs=696000000; % m
% tempS=5800;
% x=149597870000; % m regular
% y=0; % m
% U=0; % m/s
% V=29788*1.1; % m/s regular
% tmax=1; % s
% clockmax=451; % steps
% dt=100000/tmax;

% % Orbit IGNORE: Velocity Increases
% G=6.673889E-11; % m^3 kg^-1 s^-2
% Ms=1.9891E30; % kg
% Rs=696000000; % m
% tempS=5800;
% x=149597870000; % m regular
% y=0; % m
% U=0; % m/s
% V=29788*1.05; % m/s regular
% tmax=1; % s
% clockmax=400; % steps
% dt=100000/tmax;

% Orbit 3: Velocity Decreases
G=6.673889E-11; % m^3 kg^-1 s^-2
Ms=1.9891E30; % kg
Rs=696000000; % m
tempS=5800;
x=149597870000; % m regular
y=0; % m
U=0; % m/s
V=29788*0.9; % m/s regular
tmax=1; % s
clockmax = 245; % steps
dt=100000/tmax;

% Energy stays Constant Half
% % Orbit 4: * 1/6
% G=6.673889E-11; % m^3 kg^-1 s^-2
% Ms=1.9891E30; % kg
% Rs=696000000; % m
% tempS=5800;
% x=1.2466E11; % m regular
% y=0; % m
% U=0; % m/s
% V=35235; % m/s regular
% tmax=1; % s
% clockmax=317; % steps
% dt=100000/tmax;

% % Orbit 5: * 1/2
% G=6.673889E-11; % m^3 kg^-1 s^-2
% Ms=1.9891E30; % kg
% Rs=696000000; % m
% tempS=5800;
% x=7.4799E10; % m regular
% y=0; % m
% U=0; % m/s
% V=51579; % m/s regular
% tmax=1; % s
% clockmax=317; % steps
% dt=100000/tmax;

% % Orbit 6: * 1/3
% G=6.673889E-11; % m^3 kg^-1 s^-2
% Ms=1.9891E30; % kg
% Rs=696000000; % m
% tempS=5800;
% x=9.97319E10; % m regular
% y=0; % m
% U=0; % m/s
% V=42115; % m/s regular
% tmax=1; % s
% clockmax=317; % steps
% dt=100000/tmax;

% % Orbit Experiment: * 1/12
% G=6.673889E-11; % m^3 kg^-1 s^-2
% Ms=1.9891E30; % kg
% Rs=696000000; % m
% tempS=5800;
% x=1.37131E11; % m regular
% y=0; % m
% U=0; % m/s
% V=32373; % m/s regular
% tmax=1; % s
% clockmax=317; % steps
% dt=100000/tmax;

% G=6.673889E-11; % m^3 kg^-1 s^-2
% Ms=1.9891E30; % kg
% Rs=696000000; % m
% tempS=5800;
% % x=1.2466E11; % ellipse 1
% x=149597870000; % m regular
% y=0; % m
% U=0; % m/s
% % V=35235; % ellipse 1
% V=29788*1.2; % m/s regular
% % V=24122; % m/s velocity of mars
% tmax=1; % s
% clockmax=317; % steps
% % clockmax=100000; % steps
% dt=100000/tmax;
xsave=zeros(1,clockmax);
ysave=zeros(1,clockmax);
tsave=zeros(1,clockmax);
tempEsave = zeros(1,clockmax);
total_temp=0;
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
    tempE = ((tempE - 273.15) * 9/5) + 32;
    total_temp = total_temp+tempE;
    if clock == 1
        min_temp = tempE;
        max_temp = tempE;
    else
        if tempE < min_temp
            min_temp = tempE;
        end
        if tempE > max_temp
            max_temp = tempE;
        end
    end
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
average_temp = total_temp/clockmax
min_temp
max_temp