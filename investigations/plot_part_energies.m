%plot energies
energies = zeros(1,length(particles));
const_factor = (0.5*1.66*3*(10^-27))/((1.6*(10^(-19)))*(10^-3));
for i=1:length(particles)
    energies(1,i) = const_factor*(sum(particles(i).velocity.*particles(i).velocity)); %1/2mv^2
end
histogram(energies)
xlim([0 20])
xlabel('Particle energies (meV)')
ylabel('Particle count')
title('Particle energy distribution pre-sample')