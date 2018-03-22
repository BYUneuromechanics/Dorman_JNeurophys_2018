function C = calc_cost(cost_type,d,r,factor,Theta,Qf1)

C = nan(size(Theta));

for i = 1:length(Theta)
    x  = calc_x0(r,Theta(i),Qf1(i));
    if cost_type == 1
        C(i) = func_MW(x,d,factor);
    elseif cost_type == 2
        C(i) = func_ME(x,d,factor);
    end
end