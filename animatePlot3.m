function animatePlot3(h,x,y,z,n)
% animatePlot3(h,x,y,z)
% Animates plot given an animatedLine handle h and data vectors x, y and z.
%
% animatePlot3(h,x,y,z,n) animates n plots simultaneously. x,y and z
% must be matrices with n rows.

if nargin == 4
    n = 1;
end

for j=1:length(x)
    for i = 1:n
        addpoints(h(i),x(i,j),y(i,j),z(i,j));
    end
    animateNow;
end    
end
