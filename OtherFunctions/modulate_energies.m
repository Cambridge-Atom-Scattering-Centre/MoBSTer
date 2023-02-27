function [particles] = modulate_energies(particles,amount)

energies = zeros(1,length(particles));
const_factor = (0.5*1.66*3*(10^-27))/((1.6*(10^(-19)))*(10^-3));
rand_shifts = ((2*amount)*rand(1,length(particles)))-amount; %amount to shift in energy
for i=1:length(particles)
    energies(1,i) = const_factor*(sum(particles(i).velocity.*particles(i).velocity)); %1/2mv^2
end
frac_shifts = (energies+rand_shifts)./energies;
vel_shifts = sqrt(frac_shifts)
for i=1:length(particles)
    particles(i).velocity = particles(i).velocity.*vel_shifts(i);
end
end