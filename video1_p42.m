%% %%%%%%%%%%%%%%%%% Video 1.2: Global Minimizers %%%%%%%%%%%%%%%%%%%%%%%%%
function video1_p42
global FR
fig42 = figure('Position',[10 50 1280 720]);

videoTitle('Local and Global Minimizers');
videoText('$f: R\mapsto {\rm I\!R}; \quad x\mapsto y = f(x) = \frac{1}{2}\,x+\sin(x), \quad R\subseteq{\rm I\!R}$',[0.1 0.8 1 0.1])
videoText('Graph of $f$: $G(f) = \{(x,y)\in{\rm I\!R}^2 \,|\, x\in R, y=f(x)\}$', [0.1 0.7 1 0.1])
annotation('line',[0.1 0.9],[0.72 0.72])
animateNow('mediump')
videoText('$R = [5,\infty]$', [0.1 0.6 1 0.1])

animateNow('mediump')

% generate plot data
f=@(x) x/2+sin(x);
x1 = linspace(-2*pi,6,(6+2*pi)/(6*pi+2*pi)*2*FR);
x2 = linspace(6,6*pi,(6*pi-6)/(6*pi+2*pi)*2*FR);
y1 = f(x1);
y2 = f(x2);

% generate axis
ax1 = axes;
plot21 = animatedline(x1(1),y1(1),'Color','k','linestyle',':');

ax = gca;
ax.Box = 'off';
ax.YAxisLocation = 'origin';
ax.XAxisLocation = 'origin';
ax.OuterPosition = [0.05 0.05 0.8 0.8*15/25];
ax.Color = 'none';
ax.TickLabelInterpreter = 'latex';
ylim([-4.9 9]);
xlim([-4.9 19]);
% yticks([0 1 2 3 4 5])
xticks(-pi:pi:5*pi);
xticklabels({'-$\pi$','0','$\pi$','$2\pi$','$3\pi$','$4\pi$','$5\pi$'});
xaxistip(0);
hold on
ax.YAxis.Color = 'none';

animateNow('mediump')

videoArrow('$R$',12,0,45,3)

xR = [6 19];
yR = [0 0];
[XR, YR] = data2norm(xR,yR);
h = annotation('line',XR,YR,'Color','g');
xaxistip(0);
blink(h,1*FR);

ax.YAxis.Color = ax.XAxis.Color;
yaxistip(0.1);
animateNow(2*FR)

plot22 = animatedline(x2(1),y2(1),'Color','b');
animatePlot(plot21,x1,y1);
animatePlot(plot22,x2,y2);


videoArrow('$G(f)$',18, f(18),120,3)
animateNow('mediump')

xmin = x2(1);
ymin = f(xmin);

plot(xmin,ymin,'r.','MarkerSize',10)

dashedLine([xmin xmin],[ymin 0],1*FR);

videoArrow({'Global minimizer'},xmin,0,315,3)

animateNow(1*FR)

dashedLine([xmin 0],[ymin ymin],1*FR);

videoArrow({'Global minimum'},0,ymin,125,3)

animateNow('mediump')

xmin = -pi/2-1/2+4*pi:2*pi:6*pi-pi/2-1/2;
ymin = f(xmin);

plot(xmin,ymin,'ro','MarkerSize',4)

for n=1:length(xmin)
    dashedLine([xmin(n) xmin(n)],[ymin(n) 0],0.5*FR);
end

videoArrow({'Local minimizers'},xmin(1),0,-45,4)
videoArrow({''},xmin(2),0,-100,3)

animateNow('shortp')

for n=1:length(xmin)
    dashedLine([xmin(n) 0],[ymin(n) ymin(n)],0.5*FR);
end

videoArrow({'Local minima'},0,ymin(1),120,4)
videoArrow({''},0,ymin(2),160,2)




animateNow('endp')
end
