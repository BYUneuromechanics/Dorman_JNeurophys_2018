function C = func_ME(x, param)

d = param.d;

t = 0:0.001:d;
[q, qdot, qddot] = min_jerk(zeros(3,1), x, d, t);
M = calc_M(q,qdot,qddot,param);
M_mag = sqrt(M(1,:).^2 + M(2,:).^2 + M(3,:).^2 + 2*M(1,:).*M(3,:).*sin(M(2,:)));

C = trapz(t, M_mag);