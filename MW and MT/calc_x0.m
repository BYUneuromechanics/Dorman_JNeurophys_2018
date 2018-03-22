function x0  = calc_x0(r,theta,qi1)

[xs,ys] = calc_target(r,theta);

qi3 = asin(sin(qi1)*xs - cos(qi1)*ys);
qi2 = asin( (sin(qi1)*sin(qi3) - xs) / (cos(qi1)*cos(qi3)) );

x0 = [qi1, qi2, qi3]';