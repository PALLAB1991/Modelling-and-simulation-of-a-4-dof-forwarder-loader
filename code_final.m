clear all
clc
%===================================== Piston
%Piston 1
Piston.r1 = 0.035;
Piston.l1 = 0.72;
%sample time
SampleTime=.001;
%Piston 2
Piston.r2 = 0.035;
Piston.l2 = 0.61;
Piston.m2 = 72*(1/3);
Piston.cm2 =[0 0 Piston.l2/2];
Piston.rgb = [0.8, 0.8, 0.8];
Piston.pos2 = [0.19, 0.14, 0];

% Piston 3
Piston.r3 = 0.035;
Piston.l3 =1.068;
Piston.m3 = 65*(1/3);
Piston.cm3  = [0, 0, Piston.l3/2];
Piston.rgb3 = [0.8, 0.8, 0.8];
Piston.pos3 = [2.028, 0.550, 0];

% Piston 4
Piston.r4 = 0.025;
Piston.l4 = 2.64;
Piston.m4 = 50*(1/3);
Piston.cm4  = [0, 0, Piston.l4/2];
Piston.rgb4 = [0.8, 0.8, 0.8];
Piston.pos4 = [0.055, 0.235, 0];

%===================================== Cylinder
    % New
pmax = 215e6;
Cyl.BulkMod=1323e6;
Cyl.ADeadVol=0.2e-3;    
Cyl.BDeadVol=0.2e-3;
Cyl.A_pinit=1e5;      
Cyl.B_pinit=1e5; 

% Cylinder 1

Cylinder.r1=0.055;
Cylinder.D =115e-3;
Cylinder.l1=0.72;
Cylinder1.max = 720e-3;
Cylinder.m1=100;
Cylinder.cm1=[0, 0, 0];
Cylinder.rgb = [0.2, 0.2, 0.2];
Cylinder.pos1 = [-0.095, 0.2, 0.680];
Cylinder.A1 = (Cylinder.r1^2)*pi;
Cylinder.APis1 =Cylinder.A1 ;
Cylinder.Kend1 = pmax*Cylinder.A1/(1e-5);
Cylinder.bend1 = 0.5*(Cylinder.Kend1*1147)^0.5;
Cylinder1.pA = 4.5e7;

%Cylinder 2
Cylinder.r2 = 0.06;
Cylinder2.D =120e-3;
Cylinder2.max=610e-3;
Cylinder.l2 = 0.92;
Cylinder.m2 = 72*(2/3);
Cylinder.cm2 = [0, 0, Cylinder.l2/2];
Cylinder.rgb = [0.2, 0.2, 0.2];
Cylinder.pos2 = [0.401, 0.016, 0];
Cylinder.A2 = (Cylinder.r2^2)*pi;
Cylinder.APis2 = ((Cylinder.r2^2)-(Piston.r2^2))*pi;
Cylinder.Kend2 = pmax*Cylinder.A2/(1e-5);
Cylinder.bend2 = 0.5*(Cylinder.Kend2*750)^0.5;
Cylinder2.pA = 4.5e7;

%Cylinder 3
Cylinder.r3 = 0.0575;
Cylinder3.D =115e-3;
Cylinder3.max=725e-3;
Cylinder.l3 = 1.068;
Cylinder.m3 =65*(2/3) ; 
Cylinder.cm3 = [0, 0,  Cylinder.l3/2];
Cylinder.rgb = [0.2, 0.2, 0.2];
Cylinder.pos3 = [2.028, 0.55, 0];
Cylinder.A3 = (Cylinder.r3^2)*pi;
Cylinder.Kend3= pmax*Cylinder.A3/(1e-5);
Cylinder.APis3 = ((Cylinder.r3^2)-(Piston.r3^2))*pi;
Cylinder.bend3 = 0.5*(Cylinder.Kend3*380)^0.5;
Cylinder3.pA= 4.5e7;

%Cylinder 4
Cylinder.r4 = 0.045;
Cylinder4.D =70e-3;
Cylinder4.max=1850e-3;
Cylinder.l4 = 2.64;
Cylinder.m4 = 50*(2/3); 
Cylinder.cm4 = [0, 0, Cylinder.l4/2];
Cylinder.rgb = [0.2, 0.2, 0.2];
Cylinder.pos4 = [-0.737, 0.708, 0];
Cylinder.A4 = (Cylinder.r4^2)*pi;
Cylinder.Kend4= pmax*Cylinder.A4/(1e-5);
Cylinder.APis4 = ((Cylinder.r4^2)-(Piston.r4^2))*pi;
Cylinder.bend4 = 0.5*(Cylinder.Kend4*180)^0.5;
Cylinder4.pA = 4.5e7;
% friction parameter(CYL1,2,3,3)
%CYL1
FS.c1=pmax*Cylinder.A1*0.1;  %23035;
FC.c1=0.4*FS.c1;
b.c1=FS.c1-2e3;%17000;
VS.c1=0.01;
K=2000;
%CYL2

FS.c2=pmax*Cylinder.A2*0.1;    %24000;
FC.c2=0.4*FS.c2;
b.c2=FS.c2-2e3;%19000;
VS.c2=0.01;
K=2000;

%CYL3
FS.c3=pmax*Cylinder.A3*0.1; %18972.1;
FC.c3=0.4*FS.c3;
b.c3=FS.c3-2e3;
VS.c3=0.01;
K=2000;

%CYL4
FS.c4=pmax*Cylinder.A4*0.1;%17000;
FC.c4=0.4*FS.c4;
b.c4=FS.c4-2e3;%10000;
VS.c4=0.01;
K=2000;

%===================================== Pin
%extension 1
X1.c   =[-0.177 -0.075;1.743 -0.075;1.743 0.075;1.7 0.075;1.7 0.255;1.243 0.255;1.243 0.235;1.6 0.235;1.6 0.075;0.177 0.075];
X1.l   =0.15;
X1.m   =90;
X1.cm  =[-1.215, 0.000, 0.000];
X1.rgb =[0, .8, 0];
X1.pos = [1.87, 0.468, 0];

%extension2
X2.c   =[-0.177 -0.075;1.743 -0.075;1.743 0.075;1.7 0.075;1.7 0.255;1.243 0.255;1.243 0.235;1.6 0.235;1.6 0.075;0.177 0.075];
X2.m   =90;
X2.cm  =[-1.215, 0.000 0.000];
X2.rgb =[0.5, 0.5, 0.5];
X2.pos=[0.177, 0, 0];
%===================================== Pillar
Pillar.c   =[0 0;0.1 0;0.29 0.04;0.29 0.24;0.1 0.34;
    -0.07 1.38;-0.27 1.38;-0.27 1.18;-0.1 0];
Pillar.l   =0.2;
Pillar.m   =110;
Pillar.cm  = [-0.07, 0.56, 0];
Pillar.rgb = [0.8, 0.8, 0];
Pillar.pos = [0 0 .525];

%===================================== Lift
Lift.c = [0.1 -0.1; 0.2 0;0.3 -0.1;0.5 -0.1;0.6 0;3.69 0.18;3.69 0.38;2.23 0.38;2.13 0.65;1.93 0.65;1.83 0.38;0.2 0.4;-0.10 0.10;-0.10 -0.10];
Lift.l = 0.2;
Lift.m = 370;
Lift.cm = [1.4 0.25 0];
Lift.rgb = [0.8, 0.8, 0];
Lift.j = [-0.18, 1.274, 0];

%===================================== Rotator
% Pinion
Pinion.r    = 0.12;
Pinion.t    = 0.525;
Pinion.m    = 5;
Pinion.rgb  = [.8 .4 0];
Pinion.j=[0 0.525 0];
Pinion.cm=[0 0.22 0];
%Rack
Rack.dim    = [.04 .02 .8];
Rack.m      = 10;
Rack.rgb    = [.2 .4 .7];
Rack.length = 0.680*2;
Rack.height = 0.02;
Rack.t = 0.5*(Pinion.t);

%Four-bar Linkage

%Link1 parameters
FL1.j=[3.43 0.295 0];
FL1.c = [-0.05 -0.05;0.43 -0.05;0.43 0.05;-0.05 0.05];% ok
FL1.l = 0.13;
FL1.m = 15; 
FL1.cm = [0.215, 0, 0];
FL1.rgb = [0, 0, 1];

%Link2 parameters
FL2.j=[0.43 0 0];
FL2.c = [-0.05 -0.05;0.452 -0.05;0.452 0.05;-0.05 0.05];
FL2.l=0.13;
FL2.m = 15; 
FL2.cm = [0.226, 0, 0];
FL2.rgb = [0, 0, 1];

%Link2 parameters
tilt.j=[3.59 0.282 0];
tilt.c = [0 0; 0.25 0.4; 1.9 0.4; 1.84 0.62; -0.64 0.62; -0.74 0.86; -0.805 .62; -.855 .62; -.855 1.05; -.87 1.05; -.87 .62; -.95 .62; -.95 .4; -.2 .4];
tilt.l=0.13;
tiltpos.j=[-0.075 0.24 0];
FL2pos.j=[0.452 0 0];
tilt.m=170;
tilt.cm=[0.5 0.45 0];
tilt.rgb=[.6 .0 .2];

%00000000000000000000000000000HYDRAULICS

Cyl.ADeadVol=0.3e-3;    % Dead volume chamber A (piston side) [m^3]
Cyl.BDeadVol=0.3e-3;    % Dead volume chamber B (rod side) [m^3]
Cyl.BulkMod=1323e6;     % Cylinder Bulk Modulus [N/m^2](if required in the future)

%Valve lookup tables 

Q_PA_look=[5.86e-8 5.86e-8 5.86e-8 0.000876 0.0214 0.044 0.071 0.1 0.15 1];
Q_PA_break=[-1 -0.6 -0.2 0 0.1 0.2 0.3 0.4 0.5 1];

Q_BT_look=[5.86e-8 5.86e-8 5.86e-8 0.000913 0.02175 0.040 0.081 0.10 0.20 1];
Q_BT_break=[-1 -0.6 -0.2 0 0.1 0.2 0.3 0.4 0.5 1];

Q_PB_look=[1 0.1498 0.1 0.077 0.03591 0.021 0.00082 5.86e-8 5.86e-8 5.86e-8];
Q_PB_break=[-1 -0.7 -0.5 -0.3 -0.2 -0.1 0 0.2 0.8 1];

Q_AT_look=[1 0.1991 0.1227 0.07575 0.04002 0.01761 0.00075 5.86e-8 5.86e-8 5.86e-8];
Q_AT_break=[-1 -0.7 -0.5 -0.3 -0.2 -0.1 0 0.2 0.8 1];


% Flow Paths section
% plot figure of delta pressure and Q of each orifice to pick up QN
% P - A flow
%for cyl1
Valve.PA.dpN   = 3.35e6;                  % Nominal pressure difference
Valve.PA.QN    = 0.001932;               % Nominal volume flow
Valve.ptr      = 0.05e6;                 % Transition pressure 
% B - T flow
Valve.BT.dpN   = 0.5e6;                  % Nominal pressure difference
Valve.BT.QN    = 0.0007522;              % Nominal volume flow
% P - B flow
Valve.PB.dpN   = 0.5e6;                  % Nominal pressure difference
Valve.PB.QN    = 0.0007522;              % Nominal volume flow
% A - T flow
Valve.AT.dpN   = 0.5e6;                  % Nominal pressure difference
Valve.AT.QN    = 0.001932;               % Nominal volume flow

%cyl2
Valve2.PA.dpN   = 3.35e6;                  % Nominal pressure difference
Valve2.PA.QN    = 0.001932*.1;               % Nominal volume flow
Valve.ptr      = 0.05e6;                 % Transition pressure 
% B - T flow
Valve2.BT.dpN   = 0.5e6;                  % Nominal pressure difference
Valve2.BT.QN    = 0.0007522*.1;              % Nominal volume flow
% P - B flow
Valve2.PB.dpN   = 0.5e6;                  % Nominal pressure difference
Valve2.PB.QN    = 0.0007522*.1;              % Nominal volume flow
% A - T flow
Valve2.AT.dpN   = 0.5e6;                  % Nominal pressure difference
Valve2.AT.QN    = 0.001932*.1;  

%cyl3
Valve3.PA.dpN   = 3.35e6;                  % Nominal pressure difference
Valve3.PA.QN    = 0.001932*.1;               % Nominal volume flow
Valve.ptr      = 0.05e6;                 % Transition pressure 
% B - T flow
Valve3.BT.dpN   = 0.5e6;                  % Nominal pressure difference
Valve3.BT.QN    = 0.0007522*.1;              % Nominal volume flow
% P - B flow
Valve3.PB.dpN   = 0.5e6;                  % Nominal pressure difference
Valve3.PB.QN    = 0.0007522*.1;              % Nominal volume flow
% A - T flow
Valve3.AT.dpN   = 0.5e6;                  % Nominal pressure difference
Valve3.AT.QN    = 0.001932*.1;  
% CONTROL
q=41.3;
t=0.969;
Valve.delay = 0.03; % Delay

%cyl4
Valve4.PA.dpN   = 3.35e6;                  % Nominal pressure difference
Valve4.PA.QN    = 0.001932*.1;               % Nominal volume flow
Valve4.ptr      = 0.05e6;                 % Transition pressure 
% B - T flow
Valve4.BT.dpN   = 0.5e6;                  % Nominal pressure difference
Valve4.BT.QN    = 0.0007522*.1;              % Nominal volume flow
% P - B flow
Valve4.PB.dpN   = 0.5e6;                  % Nominal pressure difference
Valve4.PB.QN    = 0.0007522*.1;              % Nominal volume flow
% A - T flow
Valve4.AT.dpN   = 0.5e6;                  % Nominal pressure difference
Valve4.AT.QN    = 0.001932*.1;  

% HOSES
% Parameters for calculating pressure drop in hose A and B
%
HoseA.Dia=2.500E-02;        % Hose A dia [m]
HoseA.L=5.0;                % Hose A length[m]
HoseA.Area=pi*power(HoseA.Dia,2)/4; % Hose A cross section area [m^2]
HoseA.Vol=HoseA.Area*HoseA.L;  % Hose A volume [m^3]
HoseB.Dia=2.500E-02;        % Hose B dia [m]
HoseB.L=6.0;                % Hose B length[m]
HoseB.Area=pi*power(HoseB.Dia,2)/4;% Hose B cross section area [m^2]
HoseB.Vol=HoseB.Area*HoseB.L;  % Hose B volume [m^3]
HoseA.Bulk=400e6;           % Hose bulk modulus [N/m^2]
HoseB.Bulk=400e6;           % Hose bulk modulus [N/m^2]
Re_Critical=2300;           % Critical Reynolds number Laminar/ Turbulent []
Zeta.A1=0.15;               % Fitting A1 DP Hose length equivalent [m]
Zeta.A2=0.15;               % Fitting A2 DP Hose length equivalent [m]
Zeta.B1=0.15;               % Fitting B1 DP Hose length equivalent [m]
Zeta.B2=0.15;               % Fitting B2 DP Hose length equivalent [m]
Zeta.A=Zeta.A1+Zeta.A2;     % Zeta.A sum of HLE [m]
Zeta.B=Zeta.B1+Zeta.B2;     % Zeta.B sum of HLE [m]

% Fluid properties 
Fluid.Density=870;          % Fluid density [kg/m^3]
Fluid.Viscosity=1.60E-05;   % Fluid viscosity [m^2/s]
Fluid.Bulk=1200e6;          % Fluid bulk modulus [N/m^2]

% INITIAL VALUES FOR THE SYSTEM
% Run just before simulation starts
Cyl.A_pinit=1e5;        % Initial cyl. pressure due to force [N/m^2]
Cyl.B_pinit=1e5;        % Initial cyl. pressure due to force [N/m^2]
HoseA.pINIT=Cyl.A_pinit;  % Pressure depends on Force [N/m^2]
HoseB.pINIT=Cyl.B_pinit;  % Pressure depends on Force [N/m^2]
Valve.SupplyP=215e5;
Valve.TankP=0;
PowerOn=0;

