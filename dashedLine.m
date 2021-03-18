function dashedLine(X,Y,N)
% dashedLine(X,Y,N)
% Animates a dashed line described by X and Y with for N frames.

h = animatedline('Color','k','LineStyle','--');
x = linspace(X(1),X(end),N);
y = linspace(Y(1),Y(end),N);
for n=1:N
    addpoints(h,x(n),y(n));
    animateNow;
end     
end
