function [varargout] = drawLine(X,Y,N,n)
% drawLine(X,Y,N)
% Draws a line given X = [xstart xend] and Y = [ystart yend] for N frames.
%
% drawLine(X,Y,N,n) animates n  lines simultaneously. X and Y must be 
% matrices with n rows.

if nargin < 4
    n = 1;
end

% dir = [X(j,2);Y(j,2)]/norm([X(j,2);Y(j,2)]);
x = zeros(n,N+1);
y = zeros(n,N+1);
for j=1:n
    x(j,:) = nonLinspace(X(j,1),X(j,2),N+1,'cos');
    y(j,:) = nonLinspace(Y(j,1),Y(j,2),N+1,'cos');
end
for i=1:N
    if i > 1
        delete(h);
    end
%     for j=1:n
%             h(j) = annotation('line',[X(j,1) X(j,1)+(X(j,2)-X(j,1))*i/N], [Y(j,1) Y(j,1)+(Y(j,2)-Y(j,1))*i/N]);
%     end
    for j=1:n
            h(j) = annotation('line',[x(j,1) x(j,i+1)], [y(j,1) y(j,i+1)]);
    end
    animateNow
end

if nargout==1
    varargout{1} = h;
end
end
