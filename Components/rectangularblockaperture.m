function [particles,trajectories] = rectangularblockaperture(particles,trajectories,param,width,length)
%% function definition
%This is a rectangular aperture that operates the exact same as the
%circular aperture but instead of removing particles within a radius it
%removes particles inside of the x,y range defined by the rectangular
%aperture dimensions and origin.

%It operaterates generally the exact same, but calls the
%removetrajecrectangle.m function instead of the removetrajec.m function to
%remove the trajectories.

%it calls removetrajecrectangle with the block argument set to 1, as it is
%blocking
for i = 1:numel(particles)
    [particles(i).velocity,particles(i).position] = frametransform(particles(i).velocity,particles(i).position,param);
end
particles = propagate(particles);
[particles, trajectories] = removetrajecrectangle(particles,trajectories,width,length,1);
trajectories = addtotrajectories(particles,trajectories,param);
for i = 1:numel(particles)
    [particles(i).velocity,particles(i).position] = labtransform(particles(i).velocity,particles(i).position,param);
end
end