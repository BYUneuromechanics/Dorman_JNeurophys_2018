function [w, wdot, wddot] = min_jerk(wi, wf, d, t)

% This function calculates the position, velocity, acceleration, and jerk
% of a minimum-jerk movement that starts at wi, ends at wf, has duration d,
% and is sampled at the times included in t.

w       = repmat(wi,1,length(t)) +  (wf-wi)      *(10*(t/d).^3  -  15*(t/d).^4   +   6*(t/d).^5);
wdot    =                           (wf-wi)/d    *(30*(t/d).^2  -  60*(t/d).^3   +  30*(t/d).^4);
wddot   =                           (wf-wi)/(d^2)*(60*(t/d)     - 180*(t/d).^2   + 120*(t/d).^3);