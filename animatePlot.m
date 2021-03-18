function animatePlot(h,x,y)
% animatePlot(h,x,y)
% Animates plot given an animatedLine handle h and data vectors x and y.

N = length(x);
for n=1:N
    addpoints(h,x(n),y(n));
    animateNow;
end
end
