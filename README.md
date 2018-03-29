 This function and its accompanying subfunctions reproduce the simulations in
 Dorman GR, Davis KC, Peaden AW, and Charles SK, "Control of Redundant Wrist
 and Forearm Rotations," Journal of Neurophysiology, 2018.
 In summary, the purpose of this function is to simulate pointing movements using
 forearm pronation-supination (PS), wrist flexion-extension (FE), and
 wrist radial-ulnar deviation (RUD). These three degrees of freedom (DOF) are
 used to point the hand toward a target in a two-dimensional plane.
 Thus the number of joint DOF is 3 and the number of target DOF is 2, so
 this task is kinematically redundant, i.e. the three joint DOF can be
 combined to point to the target in infinitely many ways. An additional
 constraint is required to solve for a unique configuration of the wrist
 and forearm. This constraint can come from minimizing a cost function
 such as the work or torque experienced during the movement (MW and MT, resp.), the potential
 energy or torque in the final posture (PE or PT, resp.), or the path length (PL). This function
 calculates the final postures of movements that satisfy these
 constraints. In addition, this function calculates the final posture of a
 simplifying strategy (SS) in which the movement is planned using only FE
 and RUD but executed using all three DOF.

 Written by Steven Charles, Mechanical Engineering and Neuroscience,
 Brigham Young University, Provo, UT, USA, in 2018
