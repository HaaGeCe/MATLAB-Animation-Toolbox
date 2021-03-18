function dashedLine3(X,Y,Z,N,n)
% dashedLine(X,Y,Z,N)
% Animates a dashed line in 3D described by X, Y and Z for N frames.
%
% dashedLine(X,Y,Z,N,n) animates n dashed lines simultaneously. X, Y and Z
% must be matrices with n rows.

if nargin == 5
%     h = animatedline.empty(n,0);
    x = zeros(n,N);
    y = x;
    z = x;
else
    n = 1;
end

for i=1:n
    h(i) = animatedline('Color','k','LineStyle','--');
    x(i,:) = linspace(X(i,1),X(i,end),N);
    y(i,:) = linspace(Y(i,1),Y(i,end),N);
    z(i,:) = linspace(Z(i,1),Z(i,end),N);
end

for j=1:N
    for i = 1:n
        addpoints(h(i),x(i,j),y(i,j),z(i,j));
    end
    animateNow;
end    
end
