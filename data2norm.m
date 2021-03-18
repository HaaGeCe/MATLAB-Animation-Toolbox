function [Xnorm, Ynorm] = data2norm(x,y)
% [Xnorm, Ynorm] = data2norm(x,y)
% Converts a position given in data points units into a position given in
% normalized coordinates units.

ax = gca;
%get axes drawing area position in normalized relative to figure
% oldunits = get(ax, 'Units');
% set(ax, 'Units', 'pixels');
axpos = get(ax, 'Position');
    % axpos = plotboxpos(ax); % Use this when data aspect ratio has been
    % changed
% set(ax, 'Units', oldunits);
%get axes drawing area in data units
ax_xlim = xlim(ax);
ax_ylim = ylim(ax);
ax_norm_per_xdata = axpos(3) ./ diff(ax_xlim);
ax_norm_per_ydata = axpos(4) ./ diff(ax_ylim);
%these are figure-relative
Xnorm = (x - ax_xlim(1)) .* ax_norm_per_xdata + axpos(1);
Ynorm = (y- ax_ylim(1)) .* ax_norm_per_ydata + axpos(2);
end
