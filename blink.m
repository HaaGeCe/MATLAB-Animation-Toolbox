function blink(ax,N)
% blink(ax,t)
% Blinks an object with handle ax for N frames by increasing and
% decreasing line width. 
% Remark: Object with handle ax needs the property LineWidth.

ax_lw_old = ax.LineWidth;
for lw = [linspace(ax_lw_old,2,N/2) linspace(2,ax_lw_old,N/2)]
     ax.LineWidth = lw;
     animateNow
end
end
