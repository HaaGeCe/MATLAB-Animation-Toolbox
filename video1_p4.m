%% %%%%%%%%%%%%%%%%% Video 1: Local Minimizers %%%%%%%%%%%%%%%%%%%%%%%%%%%%
function video1_p4
global FR
fig4 = figure('Position',[10 50 1280 720]);

videoTitle('Local and Global Minimizers');
animateNow('mediump')

videoText('$f: R\mapsto {\rm I\!R}; \quad x\mapsto y = f(x) = \frac{1}{2}\,x+\sin(x), \quad R\subseteq{\rm I\!R}$',[0.1 0.8 1 0.1])
animateNow('mediump')
videoText('Graph of $f$: $G(f) = \{(x,y)\in{\rm I\!R}^2 \,|\, x\in R, y=f(x)\}$', [0.1 0.7 1 0.1])
animateNow('shortp')
drawLine([0.1 0.9],[0.72 0.72],0.5*FR)
animateNow('mediump')
videoText('$R = {\rm I\!R}$', [0.1 0.6 1 0.1])

animateNow('mediump')

f=@(x) x/2+sin(x);
x = linspace(-2*pi,6*pi,2*FR);
y = f(x);

ax12 = axes;
plot1 = animatedline(x(1),y(1),'Color','b');

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

videoArrow('$R$',-3,0,145,3)

xR = [-5 19];
yR = [0 0];
[XR, YR] = data2norm(xR,yR);
h = annotation('line',XR,YR,'Color','g');
xaxistip(0);
blink(h,1*FR);

ax.YAxis.Color = ax.XAxis.Color;
yaxistip(0.1);
animateNow('mediump')

animatePlot(plot1,x,y);

videoArrow('$G(f)$',18, f(18),120,3)
animateNow('mediump')

xmin = -pi/2-1/2:2*pi:6*pi-pi/2-1/2;
ymin = f(xmin);

plot(xmin,ymin,'r.','MarkerSize',10)

for n=1:length(xmin)
    dashedLine([xmin(n) xmin(n)],[ymin(n) 0],0.5*FR);
end

videoArrow({''},xmin(1),0,342,8.5)
videoArrow({'Local minimizers'},xmin(2),0,315,3)
videoArrow({''},xmin(3),0,230,2.8)
videoArrow({''},xmin(4),0,202,6.2)


animateNow('shortp')

for n=1:length(xmin)
    dashedLine([xmin(n) 0],[ymin(n) ymin(n)],0.5*FR);
end

videoArrow({''},0,ymin(1),125,6.5)
videoArrow({'Local minima'},0,ymin(2),135,3)
videoArrow({''},0,ymin(3),185,2)
videoArrow({''},0,ymin(4),225,3.5)

animateNow('longp')
end
