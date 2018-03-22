function M = calc_M(q, qdot, qddot, param)

g = param.g;
l = param.l;
m = param.m;
K = param.K;
D = param.D;
I = param.I;

G = -g*l*m*[q(2,:); q(1,:); ones(size(q(1,:)))];

M = I*qddot + D*qdot + K*q + G;