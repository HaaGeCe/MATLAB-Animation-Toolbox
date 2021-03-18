function movePoint(xp,yp)
% movePoint(xp,yp)
% Moves a point along the trajectory defined by (xp,yp).
for i=1:length(xp)
    if i>1
        delete([l1 l2 point]);
    end
    l1 = plot([xp(i) xp(i)],[0 yp(i)],'k--');
    l2 = plot([xp(i) 0],[yp(i) yp(i)],'k--');
    point = plot(xp(i),yp(i),'r.','markersize',10);
    animateNow;
end
end
