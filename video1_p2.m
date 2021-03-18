%% %%%%%%%%%%%%%%%%% Video 1: No minimizer exists %%%%%%%%%%%%%%%%%%%%%%%%%
function video1_p2
global FR
fig2 = figure('Position',[10 50 1280 720]);

videoTitle('(Strong) Minimizers and Minima');

videoText('$f: R\mapsto {\rm I\!R}; \quad x\mapsto y = f(x) = (x-2)^2+1, \quad R\subseteq{\rm I\!R}$',[0.1 0.8 1 0.1])
videoText('Graph of $f$: $G(f) = \{(x,y)\in{\rm I\!R}^2 \,|\, x\in R, y=f(x)\}$', [0.1 0.7 1 0.1])

annotation('line',[0.1 0.9],[0.72 0.72])

animateNow('mediump')

videoText('$R = (3, \infty]$', [0.1 0.6 1 0.1])

animateNow('mediump')

f = @(x) (x-2).^2+1;
x1 = linspace(-1,3,4/6*2*FR);
y1 = f(x1);

x2 = linspace(3,5,2/6*2*FR);
y2 = f(x2);

ax3 = axes;
plot21 = animatedline(x1(1),y1(1),'Color','k','linestyle',':');


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


% move point #0
xp = nonLinspace(3.8, 3,2*FR,'cos');
yp = f(xp);
movePoint(xp,yp)
animateNow('shortp')
% zoom in #1
%rectangle coordinates
xr1 = 2.8;
xr2 = 3.2;
yr1 = 1.8;
yr2 = 2.2;

plot([xr1 xr2 xr2 xr1 xr1],[yr1 yr1 yr2 yr2 yr1],'k')
animateNow('shortp')
ax2 = axes('OuterPosition',[0.45 0.3 0.2 0.2*1.45],...
    'visible','off',...
    'xlim',[xr1 xr2],...
    'ylim',[yr1 yr2]);
hold on

axes(ax)
[xrnorm1, yrnorm1] = data2norm([xr1 xr2], [yr1 yr2]);
axes(ax2)
[xrnorm2, yrnorm2] = data2norm([xr1 xr2], [yr1 yr2]);
drawLine([xrnorm1(2) xrnorm2(1);xrnorm1(2) xrnorm2(1)],[yrnorm1(2) yrnorm2(2);yrnorm1(1) yrnorm2(1)],1*FR,2)

x1 = linspace(xr1,3,FR);
x2 = linspace(3,xr2,FR);
y1 = f(x1);
y2 = f(x2);

plot(x1,y1,'k:')
plot(x2,y2,'b')
plot([xr1 xr2 xr2 xr1 xr1],[yr1 yr1 yr2 yr2 yr1],'k')
animateNow('shortp')

% move point #1
xp = nonLinspace(sqrt(yr2-1)+2, 3,2*FR,'cos');
yp = f(xp);
movePoint(xp,yp)
animateNow('shortp')

% zoom in #2
xr1 = 2.97;
xr2 = 3.03;
yr1 = 1.97;
yr2 = 2.03;

plot([xr1 xr2 xr2 xr1 xr1],[yr1 yr1 yr2 yr2 yr1],'k')
animateNow('shortp')
ax3 = axes('OuterPosition',[0.7 0.3 0.2 0.2*1.45],...
    'visible','off',...
    'xlim',[xr1 xr2],...
    'ylim',[yr1 yr2]);
hold on

axes(ax2)
[xrnorm1, yrnorm1] = data2norm([xr1 xr2], [yr1 yr2]);
axes(ax3)
[xrnorm2, yrnorm2] = data2norm([xr1 xr2], [yr1 yr2]);
drawLine([xrnorm1(2) xrnorm2(1);xrnorm1(2) xrnorm2(1)],[yrnorm1(2) yrnorm2(2);yrnorm1(1) yrnorm2(1)],1*FR,2)

x1 = linspace(xr1,3,FR);
x2 = linspace(3,xr2,FR);
y1 = f(x1);
y2 = f(x2);

plot(x1,y1,'k:')
plot(x2,y2,'b')
plot([xr1 xr2 xr2 xr1 xr1],[yr1 yr1 yr2 yr2 yr1],'k')
animateNow('shortp')
% move point #2
xp = nonLinspace(sqrt(yr2-1)+2, 3,2*FR,'cos');
yp = f(xp);
movePoint(xp,yp)
animateNow('shortp')
videoTitle('.\phantom{..}',[0.88 0.4 0.1 0.1])
animateNow(0.5*FR)
videoTitle('..\phantom{.}',[0.88 0.4 0.1 0.1])
animateNow(0.5*FR)
videoTitle('...',[0.88 0.4 0.1 0.1])
animateNow('shortp')
videoText('No minimizer exists',[0.55 0.19 0.5 0.1])

animateNow('endp')
end
