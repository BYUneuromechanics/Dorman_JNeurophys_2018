function [c, ceq] = nonlcon(x,r,theta)

c = [];

[xs,ys] = calc_target(r,theta);
ceq     = [ xs - (-cos(x(1))*sin(x(2))*cos(x(3)) + sin(x(1))*sin(x(3)));...
                ys - (-sin(x(1))*sin(x(2))*cos(x(3)) - cos(x(1))*sin(x(3)))];