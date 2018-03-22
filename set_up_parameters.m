function param = set_up_parameters()

% DEFAULT VALUES

% Distance and duration of movements
param.r = 15*pi/180;  % Distance from center target to peripheral target (rad)
param.d = 0.25;       % Duration of movement (sec)

% Gravitoinertial parameters
param.g = 9.81;       % Gravitational acceleration (m/s^2)
param.l = 0.062;      % Distance from wrist joint to center of mass of hand (m)
param.m = 0.392;      % Mass of hand (kg)

% Joint stiffness matrix (Nm/rad)
K      = zeros(3,3);
K(1,1) = 0.792;
K(1,2) = 0.049;
K(1,3) = 0.220;
K(2,1) = K(1,2);
K(2,2) = 0.853;
K(2,3) =-0.089;
K(3,1) = K(1,3);
K(3,2) = K(2,3);
K(3,3) = 2.580;
param.K= K;

% Joint damping matrix (Nms/rad)
D      = zeros(3,3);
D(1,1) = 0.0299;
D(1,2) = 0.0023;
D(1,3) = 0.0074;
D(2,1) = D(1,2);
D(2,2) = 0.0300; 
D(2,3) =-0.0033;
D(3,1) = D(1,3);
D(3,2) = D(2,3);
D(3,3) = 0.0921;
param.D= D;

% Joint inertia matrix (Nms^2/rad)
I      = zeros(3,3);
Ihx    = 0.00249;
Ihy    = 0.00037;
Ihz    = 0.00220;
Iay    = 0.00094;
I(1,1) = Ihy + Iay;
I(2,2) = Ihz;
I(3,3) = Ihx;
param.I= I;