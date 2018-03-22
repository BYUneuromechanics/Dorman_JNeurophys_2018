function [xs,ys] = calc_target(r,theta)

xs = sin(r)*cos(theta);
ys = sin(r)*sin(theta);