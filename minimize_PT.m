function p_PT = minimize_PT(theta, param)

r = param.r;
g = param.g;
l = param.l;
m = param.m;
K = param.K;

P_est = (-90:0.01:90)*pi/180;
M_mag = zeros(size(P_est));

for i = 1:length(P_est)
    xs = sin(r)*cos(theta);
    ys = sin(r)*sin(theta);
    p = P_est(i);
    u = asin(sin(p)*xs - cos(p)*ys);
    f = asin( (sin(p)*sin(u) - xs) / (cos(p)*cos(u)) );
 
    g_vector = [-cos(p)*sin(f)*cos(u)+sin(p)*sin(u);...
        -sin(p)*cos(f)*cos(u);...
        sin(p)*sin(f)*sin(u)-cos(p)*cos(u)];
    M = K*[p,f,u]' + g*l*m*g_vector;
    M_mag(i) = sqrt(M(1)^2 + M(2)^2 + M(3)^2 + 2*M(1)*M(3)*sin(f));
end

[min_value, min_index] = min(M_mag);
p_PT = P_est(min_index);