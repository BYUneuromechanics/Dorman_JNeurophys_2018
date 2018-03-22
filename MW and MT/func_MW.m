function C = func_MW(x, param)

d = param.d;

t = 0:0.001:d;
[q, qdot, qddot] = min_jerk(zeros(3,1), x, d, t);
M = calc_M(q,qdot,qddot, param);

C = trapz(q(1,:), M(1,:)) + trapz(q(2,:), M(2,:)) + trapz(q(3,:), M(3,:));