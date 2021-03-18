function [varargout] = videoArrow3(string,x,y,z,ax,ay,az,length,method,varargin)
% videoArrow3(string,x,y,z,theta,length)
% Draws an arrow (with text given in string) pointing at coordinate (x,y,z)
% from angle theta (degrees) about the camera view axis with length length. 
%
% videoArrow3(string,x,y,z,ax,ay,az,length,method)
%   method = 'angle': Draws an arrow (with text given in string) pointing at coordinate (x,y,z)
%   from angle (ax, ay, az) about (x axis, y axis, z axis), respectively.
%
%   method = 'vector': Specify (ax,ay,az) as the vector coordinate from
%   where the arrow will start. (x,y,z) is considered the origin.
%
%   method = 'gradient': (x,y,z) is the point of the gradient, (ax,ay,az)
%   is the gradient. The arrow will be scaled to length.
%
% videoArrow3(string,x,y,z,ax,ay,az,length,method,color) specifies color either as string or RGB vector
% (default black)
%
% videoArrow3(string,x,y,z,ax,ay,az,length,method,alignment) forces text
% alignment to be 'left' or 'right'.
%
% videoArrow3(string,x,y,z,ax,ay,az,length,method,color,alignment) specifies color and forces text
% alignment to be 'left' or 'right'.
%
% [ha ht] = videoArrow3(___) returns the handle of the arrow and handle of
% the text.


rotx = @(x) [1 0 0; 0 cosd(x) -sind(x); 0 sind(x) cosd(x)];
roty = @(x) [cosd(x) 0 sind(x); 0 1 0; -sind(x) 0 cosd(x)];
rotz = @(x) [cosd(x) -sind(x) 0; sind(x) cosd(x) 0; 0 0 1];

if nargin == 6
    theta = ax;
    length = ay;
    dir_cam = get(gca,'CameraPosition')/norm(get(gca,'CameraPosition'));
    dir = rotz(theta)*dir_cam';
    method='camposition';
elseif nargin >= 9
    switch method
        case 'vector'
            dir = [ax; ay; az]/norm([ax; ay; az]);

        case 'angle'
            dir = rotx(ax)*roty(ay)*rotz(az)*[x;y;z];
            
        case 'gradient'
            
    end
end

if strcmp('gradient',method)
    dir = [ax; ay; az]/norm([ax; ay; az])*length;
    X = [x x+dir(1)];
    Y = [y y+dir(2)];
    Z = [z z+dir(3)];
else
    X = [length*dir(1)+x x+length/25*dir(1)];
    Y = [length*dir(2)+y y+length/25*dir(2)];
    Z = [length*dir(3)+z z+length/25*dir(3)];
end

if (Y(2)-Y(1)) < 0
    alignment = 'left';
else
    alignment = 'right';
end

if isempty(varargin)
	color = [0 0 0];
elseif strcmp(varargin{1},'left') || strcmp(varargin{1},'right')
    alignment = varargin{1};
    color = [0 0 0];
elseif size(varargin) == 2
    color = varargin{1};
    alignment = varargin{2};
else
    color = varargin{1};
end

ha=arrow3d(X,Y,Z,0.85,0.015,0.075,color);
if strcmp('gradient',method)
    ht=text(X(2),Y(2),Z(2),string,'Interpreter','latex',...
    'FontSize',14,...
    'HorizontalAlignment',alignment,...
    'VerticalAlignment','bottom');
else
    ht=text(X(1),Y(1),Z(1),string,'Interpreter','latex',...
    'FontSize',14,...
    'HorizontalAlignment',alignment,...
    'VerticalAlignment','bottom');
end
if nargout == 2
    varargout{1} = ha;
    varargout{2} = ht;
end
if nargout == 5
    varargout{1} = ha;
    varargout{2} = ht; 
    varargout{3} = X;
    varargout{4} = Y;
    varargout{5} = Z;
end
end
