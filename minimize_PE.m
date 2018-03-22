function p_PE = minimize_PE(theta, param)

r = param.r;
g = param.g;
l = param.l;
m = param.m;
K = param.K;

P_est = (-90:0.01:90)*pi/180;
PE = zeros(size(P_est));

for i = 1:length(P_est)
    xs = sin(r)*cos(theta);
    ys = sin(r)*sin(theta);
    p = P_est(i);
    u = asin(sin(p)*xs - cos(p)*ys);
    f = asin( (sin(p)*sin(u) - xs) / (cos(p)*cos(u)) );
    
    q = [p f u]';
    PE(i) = 0.5*q'*K*q - g*l*m*(sin(p)*sin(f)*cos(u)+cos(p)*sin(u));

end

[min_value, min_index] = min(PE);
p_PE = P_est(min_index);