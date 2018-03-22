function p = simulate_SS(theta, param)

r = param.r;
g = param.g;
l = param.l;
m = param.m;
K = param.K;

K_fu = K(2:3,2:3);
K_pfu = K;

G = g*l*m*[0 1 0; 1 0 0; 0 0 0];
N = g*l*m*[0; 0; 1];

xs = sin(r)*cos(theta);
ys = sin(r)*sin(theta);

u = asin(-ys);
f = asin(-xs/cos(u));

q_fu = [f; u];
M_fu = K_fu*q_fu - [0; m*g*l*cos(u)];

M_pfu = [0; M_fu];
q_pfu = inv(K_pfu - G)*(M_pfu + N);

p = q_pfu(1);