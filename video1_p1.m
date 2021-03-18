%% %%%%%%%%%%%%%%%%% Video 1: (Strong) Minimizers and Minima %%%%%%%%%%%%%%
function video1_p1
global FR
fig1 = figure('Position',[10 50 1280 720]);

videoTitle('(Strong) Minimizers and Minima');
animateNow('mediump')

videoText('$f: R\mapsto {\rm I\!R}; \quad x\mapsto y = f(x) = (x-2)^2+1, \quad R\subseteq{\rm I\!R}$',[0.1 0.8 1 0.1])
animateNow('mediump')
videoText('Graph of $f$: $G(f) = \{(x,y)\in{\rm I\!R}^2 \,|\, x\in R, y=f(x)\}$', [0.1 0.7 1 0.1])
animateNow('shortp')
drawLine([0.1 0.9],[0.72 0.72],0.5*FR)

animateNow('mediump')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Plot 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
videoText('$R = {\rm I\!R}$', [0.1 0.6 1 0.1])

animateNow('mediump')

x = linspace(-1,5,2*FR);
y = (x-2).^2+1;

ax1 = axes;
plot1 = animatedline(x(1),y(1),'Color','b');

ax = gca;
ax.Box = 'off';
ax.YAxisLocation = 'origin';
ax.OuterPosition = [0.05 0.05 0.4 0.4*6.7/5.1];
ax.Color = 'none';
ax.TickLabelInterpreter = 'latex';
ylim([0 4.6]);
xlim([-1 4.6]);
yticks([0 1 2 3 4])
xaxistip(0);
hold on
ax.YAxis.Color = 'none';

animateNow('mediump')

videoArrow('$R$',-0.5,0,220,0.5)

xR = [-1 4.6];
yR = [0 0];
[XR, YR] = data2norm(xR,yR);
h = annotation('line',XR,YR,'Color','g');
xaxistip(0);
blink(h,1*FR);

ax.YAxis.Color = ax.XAxis.Color;
yaxistip(0.1);
animateNow('mediump')

animatePlot(plot1,x,y);

videoArrow('$G(f)$',3.6, 3.6,135,0.5)
animateNow('mediump')

plot(2,1,'r.','MarkerSize',10)

dashedLine([2 2],[1 0],1*FR)
videoArrow({'$\bar{x} = 2$', 'minimizer'},2,0,45,0.5)
animateNow('shortp')
dashedLine([2 0],[1 1],1*FR)
videoArrow({'$\bar{y} = f(\bar{x}) = 1$', 'minimum'},0,1,135,0.5)

animateNow('longp')

%%%%%%%%%%%%%%%%%%%%%%%% Plot 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
videoText('$R = [3, \infty]$', [0.1+0.5 0.6 1 0.1])

animateNow('mediump')


x1 = linspace(-1,3,4/6*2*FR);
y1 = (x1-2).^2+1;

x2 = linspace(3,5,2/6*2*FR);
y2 = (x2-2).^2+1;

ax2 = axes;
plot21 = animatedline(x1(1),y1(1),'Color','k','linestyle',':');


ax = gca;
ax.Box = 'off';
ax.YAxisLocation = 'origin';
ax.OuterPosition = [0.5 0.05 0.4 0.4*6.7/5.1];
ax.Color = 'none';
ax.TickLabelInterpreter = 'latex';
ylim([0 4.6]);
xlim([-1 4.6]);
yticks([0 1 2 3 4])
xaxistip(0);
hold on
ax.YAxis.Color = 'none';
animateNow('mediump')

videoArrow('$R$',3.7,0,330,0.5)

xR = [3 4.6];
yR = [0 0];
[XR, YR] = data2norm(xR,yR);
h = annotation('line',XR,YR,'Color','g');
xaxistip(0);
blink(h,1*FR);

ax.YAxis.Color = ax.XAxis.Color;
yaxistip(0.1);
animateNow('mediump')

animatePlot(plot21,x1,y1);

plot22 = animatedline(x2(1),y2(1),'Color','b');
animatePlot(plot22,x2,y2);

videoArrow('$G(f)$',3.6, 3.6,135,0.5)
animateNow('mediump')

plot(3,2,'r.','MarkerSize',10)

dashedLine([3 3],[2 0],1*FR)
videoArrow({'$\bar{x} = 3$', 'minimizer'},3,0,45,0.5)
animateNow('mediump')
dashedLine([3 0],[2 2],1*FR)
videoArrow({'$\bar{y} = f(\bar{x}) = 2$', 'minimum'},0,2,220,0.5)

animateNow('longp')
end
