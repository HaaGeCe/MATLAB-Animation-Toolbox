function [varargout] = rotateArrow3(string,x,y,z,ax,ay,az,length,N,varargin)
% [ha ht] = rotateArrow3(string,X,Y,Z,ax,ay,az,length,N)
% Rotate an arrow around arrow starting point.
% X = [x0 xd], Y = [y0 yd], Z = [z0 zd] where the arrow goes from
% (x0,y0,z0) to (xd,yd,zd).
% Rotates ax degrees about x axis, ay degrees about y axis and az degrees
% about z axis.
% Rotation is performed in N frames.
% Returns handle of final arrow.
%
% [ha ht X Y Z] = rotateArrow3(string,X,Y,Z,ax,ay,az,length,N)
% Returns coordinates for rotated arrow as well.

if isempty(varargin)
    color = [0 0 0];
else
    color = varargin{1};
end

rotx = @(x) [1 0 0; 0 cosd(x) -sind(x); 0 sind(x) cosd(x)];
roty = @(x) [cosd(x) 0 sind(x); 0 1 0; -sind(x) 0 cosd(x)];
rotz = @(x) [cosd(x) -sind(x) 0; sind(x) cosd(x) 0; 0 0 1];

AX = nonLinspace(0,ax,N,'cos');
AY = nonLinspace(0,ay,N,'cos');
AZ = nonLinspace(0,az,N,'cos');
init_dir = [x(2)-x(1);y(2)-y(1);z(2)-z(1)]/norm([x(2)-x(1);y(2)-y(1);z(2)-z(1)]);
for i = 1:N
    if i>1
        delete([ha ht]);
    end
    dir = rotx(AX(i))*roty(AY(i))*rotz(AZ(i))*(init_dir*length);
    X = [x(1) dir(1)+x(1)];
    Y = [y(1) dir(2)+y(1)];
    Z = [z(1) dir(3)+z(1)];
%     if (Y(2)-Y(1)) < 0
        alignment = 'left';
%     else
%         alignment = 'right';
%     end
    ha=arrow3d(X,Y,Z,0.85,0.015,0.075,color);
    ht=text(X(2),Y(2),Z(2),string,'Interpreter','latex',...
    'FontSize',14,...
    'HorizontalAlignment',alignment,...
    'VerticalAlignment','bottom');

    animateNow(1)
end

if nargout >= 2
    varargout{1} = ha;
    varargout{2} = ht;
end
if nargout == 5
    varargout{3} = X;
    varargout{4} = Y;
    varargout{5} = Z;
end
end
