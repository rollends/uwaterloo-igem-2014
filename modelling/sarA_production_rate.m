% I think this doesn't make sense, because our units are
% fluor (unknown units) / density of cells @ 595 nm / fluor A.U * mean #
% molecules per cell

% Very tiny script to fit the three SarA P1 data points from Figure 2B
% in Malone et al., http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2693297/

% Disregarding the timepoint at 16h because it's obviously reached
% steady-state at that point (which also, clearly, means that a linear
% approximation is incorrect, but it allows us to define a single value for
% SarA P1 expression)

time_h=[4 5 6];

% Values for relative fluorescence measured super-hackily by interpolating the
% pixels in the figure (which is also why they are to the nearest 50)
fluorescence_rel=[850 1680 3130];

% I then normalized to the number of molecules using Wu & Pollard:
% 0.00676 A.U / mean # molecules per cell from Wu & Pollard
fluorescence_norm = fluorescence_rel / 0.00676;

stats=regstats(fluorescence_norm,time_h,'linear')
coefficients=stats.beta