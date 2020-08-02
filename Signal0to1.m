function signal0to1 = Signal0to1( signal )

maxim=max(signal);
minim=min(signal);

signal0to1=(signal-minim)/(maxim-minim); 


end

