function [varargout] = videoTextMedium(string,dim,alignment)
% h = videoText(string,dim)
% Writes medium left-aligned text at dim = [left bottom width height].
%
% h = videoText(string,dim,alignment) makes it possible to change
% alignment.
if nargin == 1
    dim = [0 0.9 1 0.1];
elseif nargin == 2
    alignment = 'left';
end

h=annotation('textbox',dim,...
    'string',string,...
    'FontSize',17,...
    'Interpreter','latex',...
    'LineStyle','none',...
    'fitboxtotext','on',...
    'horizontalalignment',alignment);

if nargout == 1
    varargout{1} = h;
end
end
