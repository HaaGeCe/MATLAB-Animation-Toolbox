function axistip3(size,offset,axis,axisname)
% axistip3(size,offset,axis)
% Makes arrow tips and labels on axes in 3D plots. 
% Specify axis as a string ('x', 'y' or 'z').
% Size is the length of the arrow tip. Offset is the label offset.

if nargin == 3
    axisname = axis;
end

switch axis
    case 'x'
        col = get(gca,'XColor');
        lim = get(gca,'XLim');
        X = [lim(2)-size lim(2)];
        arrow3d([X(1) X(2)],[0 0],[0 0],0,0.01,size/4,col);
        text(X(2)+offset,0,0,['$' axisname '$'],'interpreter','latex')
        
    case 'y'
        col = get(gca,'YColor');
        lim = get(gca,'YLim');
        Y = [lim(2)-size lim(2)];
        arrow3d([0 0],[Y(1) Y(2)],[0 0],0,0.01,size/4,col);
        text(0,Y(2)+offset,0,['$' axisname '$'],'interpreter','latex')
        
    case 'z'
        col = get(gca,'ZColor');
        lim = get(gca,'ZLim');
        Z = [lim(2)-size lim(2)];
        arrow3d([0 0],[0 0],[Z(1) Z(2)],0,0.01,size/4,col);
        text(0,0,Z(2)+offset,['$' axisname '$'],'interpreter','latex')
        
    otherwise
        warning(['No axis with name ' axis ' was found. No axis tip drawn.']); 
end
end
