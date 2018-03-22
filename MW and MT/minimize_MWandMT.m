function p = minimize_MWandME(cost_type, theta, param)

r = param.r;

% cost_type:    1 for Mechanical Work, 2 for Movement Effort
if cost_type == 1
    func = @(x)func_MW(x,param);
elseif cost_type == 2
    func = @(x)func_MT(x,param);
end

% ------------------ optimize --------------------
    % 'interior-point', 'sqp', 'active-set', 'trust-region-reflective'
    options = optimset(...
        'Algorithm', 'active-set', ...
        'AlwaysHonorConstraints', 'bounds', ...
        'MaxIter', 500, ...
        'MaxFunEvals', 10000, ...
        'TolCon', 1e-6, ...
        'TolFun', 1e-6, ...
        'FinDiffType', 'forward');
%         'display', 'iter-detailed'
%         'Diagnostics', 'off'
%     options = optimset(options, 'GradObj', 'on', 'GradConstr', 'on');

% ----------------------------------------------------

x0 = zeros(3,1);
A   = [];
b   = [];
Aeq = [];
beq = [];
lb  = [-30, -30, -80]'*pi/180;
ub  = [30, 30, 80]'*pi/180;

nonlcon_func = @(x)nonlcon(x,r,theta);
x = fmincon(func, x0, A, b, Aeq, beq, lb, ub, nonlcon_func, options);

p = x(1);