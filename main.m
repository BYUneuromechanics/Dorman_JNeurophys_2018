function main()
% This function and its accompanying subfunctions reproduce the simulations in
% Dorman GR, Davis KC, Peaden AW, and Charles SK, "Control of Redundant Wrist
% and Forearm Rotations," Journal of Neurophysiology, 2018.
% In summary, the purpose of this function is to simulate pointing movements using
% forearm pronation-supination (PS), wrist flexion-extension (FE), and
% wrist radial-ulnar deviation (RUD). These three degrees of freedom (DOF) are
% used to point the hand toward a target in a two-dimensional plane.
% Thus the number of joint DOF is 3 and the number of target DOF is 2, so
% this task is kinematically redundant, i.e. the three joint DOF can be
% combined to point to the target in infinitely many ways. An additional
% constraint is required to solve for a unique configuration of the wrist
% and forearm. This constraint can come from minimizing a cost function
% such as the work or torque experienced during the movement (MW and MT, resp.), the potential
% energy or torque in the final posture (PE or PT, resp.), or the path length (PL). This function
% calculates the final postures of movements that satisfy these
% constraints. In addition, this function calculates the final posture of a
% simplifying strategy (SS) in which the movement is planned using only FE
% and RUD but executed using all three DOF.
%
% Written by Steven Charles, Mechanical Engineering and Neuroscience,
% Brigham Young University, Provo, UT, USA, in 2018

path(path,'.\MW and MT');   % The files relating to cost functions MW and MT
                            % are contained in a subfolder

% SPECIFICATIONS
param = set_up_parameters();

% OPTIMIZATION
% Set up vector of movement directions (angle in rad b/w xs-axis and target)
Theta = (90:-10:-270)*pi/180;

% For each movement direction, calculate p (PS) predicted by each control strategy
for i = 1:length(Theta)
    i
    p_MW(i) = minimize_MWandMT(1, Theta(i), param);
    p_MT(i) = minimize_MWandMT(2, Theta(i), param);
    p_PT(i) = minimize_PT(Theta(i), param);
    p_PE(i) = minimize_PE(Theta(i), param);
    p_PL(i) = minimize_PL(Theta(i), param);
    p_SS(i) = simulate_SS(Theta(i), param);
end

% From predicted p, calculate predicted f and u (FE and RUD)
[f_MW, u_MW] = calc_fu(Theta,p_MW);
[f_MT, u_MT] = calc_fu(Theta,p_MT);
[f_PT, u_PT] = calc_fu(Theta,p_PT);
[f_PE, u_PE] = calc_fu(Theta,p_PE);
[f_PL, u_PL] = calc_fu(Theta,p_PL);
[f_SS, u_SS] = calc_fu(Theta,p_SS);

% PLOT
% Recreate Figure 4 in journal article
eta = (0:10:360)*pi/180;
subplot(3,1,1)
plot(eta*180/pi, [f_MW; f_MT; f_PT; f_PE; f_PL; f_SS]'*180/pi)
ylabel('f [deg]')
legend('MW', 'MT', 'PT', 'PE', 'PL', 'SS')
title('f, u, and p vs. \theta')
xticks(0:90:360)
xlim([0 360])
subplot(3,1,2)
plot(eta*180/pi, [u_MW; u_MT; u_PT; u_PE; u_PL; u_SS]'*180/pi)
ylabel('u [deg]')
xticks(0:90:360)
xlim([0 360])
subplot(3,1,3)
plot(eta*180/pi, [p_MW; p_MT; p_PT; p_PE; p_PL; p_SS]'*180/pi)
xlabel('\theta [deg]')
ylabel('p [deg]')
xticks(0:90:360)
xlim([0 360])