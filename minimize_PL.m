function p_PL = minimize_PL(theta, param)

r = param.r;

P_est = (-90:0.01:90)*pi/180;
C_PL = zeros(size(P_est));

for i = 1:length(P_est)
    xs = sin(r)*cos(theta);
    ys = sin(r)*sin(theta);
    p = P_est(i);
    u = asin(sin(p)*xs - cos(p)*ys);
    f = asin( (sin(p)*sin(u) - xs) / (cos(p)*cos(u)) );
    
    phi = acos(0.5*(cos(p)*cos(f) + cos(p)*cos(u) + cos(f)*cos(u) - sin(p)*sin(f)*sin(u) - 1));
    C_PL(i) = abs(phi);

end

[min_value, min_index] = min(C_PL);
p_PL = P_est(min_index);