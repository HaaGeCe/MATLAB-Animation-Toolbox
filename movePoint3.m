function varargout = movePoint3(xp,yp,zp)
% movePoint(xp,yp,zp)
% Moves a point along the trajectory defined by (xp,yp,zp).
%
% [dashedline pointz pointxy] = movePoint(xp,yp,zp) returns handles for the
% dashed line and the two red points.

for i=1:length(xp)
    if i>1
        delete([l1 pointz pointxy]);
    end
%     l1 = plot([xp(i) xp(i)],[0 yp(i)],'k--');
%     l2 = plot([xp(i) 0],[yp(i) yp(i)],'k--');
    l1 = plot3([xp(i) xp(i)],[yp(i) yp(i)], [zp(i) 0],'k--');
    pointz = plot3(xp(i),yp(i),zp(i),'r.','markersize',10);
    pointxy = plot3(xp(i),yp(i),0,'r.','markersize',10);
    animateNow;
end
if nargout == 3
    varargout{1} = l1;
    varargout{2} = pointz;
    varargout{3} = pointxy;
end

end
