function [varargout] = videoArrow(string,x,y,theta,length)
% videoArrow(string,x,y,theta,length)
% Draws an arrow (with text given in string) pointing at coordinate (x,y) from angle theta (degrees)
% with length length. 

if nargin == 4
    length=1;
end

X = [length*cosd(theta)+x x+length/25*cosd(theta)];
Y = [length*sind(theta)+y y+length/25*sind(theta)];

[Xnorm, Ynorm] = data2norm(X,Y);

h=annotation('textarrow',...
    'X',Xnorm,...
    'Y',Ynorm,...,
    'string',string,...
    'FontSize',14,...
    'Interpreter','latex',...
    'horizontalalignment','left');

if nargout == 1
    varargout{1} = h;
end
end
