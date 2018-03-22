function [f,u] = calc_fu(theta, p)

% Calculate f and u from p (PS), xs, and ys

r = 15*pi/180;
xs = sin(r)*cos(theta);
ys = sin(r)*sin(theta);

u = asin(xs.*sin(p) - ys.*cos(p));
f = asin( (sin(p).*sin(u) - xs) ./ (cos(p).*cos(u)) );