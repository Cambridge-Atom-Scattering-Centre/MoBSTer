%% copyright notice
% Copyright (c) 2020, Fraser Birks and William Allison.
% All rights reserved.
% This file is part of MoBSTer - a framework to simulate Molecular Beam Scattering Using Trajectories, subject to the GNU/GPL-3.0-or-later.

function Fv = cartesianhexapole(t,Y,kfac,fs,radius);
%% FUNCTION DEFINITON
%This is the cartesian differential equation solver for a perfect hexapole.

%Here's how it works, m is the mass of the particle, xfac and yfac change
%depending on the quadrant of the particle.
%k is a parameter dependent on the field.
%the 4 coupled differential equations are solved using ode23.

%see the manual for the specific physics layed out here.

m = 1.66*(10^-27)*3;
C = (fs/(3*(radius)^2));
k = -(1.082e-26)*6*C*fs;
k = k*kfac;
xfac = 1;
yfac = 1;
if Y(1)<0
    yfac = -1;
end
if Y(3)<0
    xfac = -1;
end
Fv(1,1) = Y(2);
Fv(2,1) = yfac*(k/m)*sqrt((Y(1)^2)+(Y(3)^2))*sin(atan(abs(Y(1)/Y(3))));
Fv(3,1) = Y(4);
Fv(4,1) = xfac*(k/m)*sqrt((Y(1)^2)+(Y(3)^2))*cos(atan(abs(Y(1)/Y(3))));