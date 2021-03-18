%% %%%%%%%%%%%%%%%%% Video 1: Weak Minimizers and Minima %%%%%%%%%%%%%%%%%%
function video1_p3
global FR
fig3 = figure('Position',[10 50 1280 720]);

videoTitle('Weak Minimizers and Minima');
animateNow('mediump')

videoText('$f: R\mapsto {\rm I\!R}; \quad x\mapsto y = f(x) = \bigg\{\matrix{|x|-3 & x\notin[-4,4] \cr 1 & x\in[-4,4]}, \quad R\subseteq{\rm I\!R}$',[0.1 0.8 1 0.1])
animateNow('mediump')
videoText('Graph of $f$: $G(f) = \{(x,y)\in{\rm I\!R}^2 \,|\, x\in R, y=f(x)\}$', [0.1 0.68 1 0.1])
animateNow('shortp')
drawLine([0.1 0.9],[0.7 0.7],0.5*FR)
animateNow('mediump')
videoText('$R = {\rm I\!R}$', [0.1 0.58 1 0.1])

animateNow('mediump')

f=@(x) (abs(x)>4).*(abs(x)-3)+ (abs(x)<=4);
% x = linspace(-10,10,2*FR);
x = -10:0.2:10;
y = f(x);

axes;
plot1 = animatedline(x(1),y(1),'Color','b');

ax = gca;
ax.Box = 'off';
ax.YAxisLocation = 'origin';
ax.XAxisLocation = 'origin';
ax.OuterPosition = [0.05 0.1 0.6 0.43];
ax.Color = 'none';
ax.TickLabelInterpreter = 'latex';
ylim([0 9.5]);
xlim([-9.5 9.5]);
% yticks([0 1 2 3 4 5])
xaxistip(0);
hold on
ax.YAxis.Color = 'none';

animateNow('mediump')

videoArrow('$R$',-07,0,220,3)

xR = [-9.5 9.5];
yR = [0 0];
[XR, YR] = data2norm(xR,yR);
h = annotation('line',XR,YR,'Color','g');
xaxistip(0);
blink(h,1*FR);

animateNow('mediump')
ax.YAxis.Color = ax.XAxis.Color;
yaxistip(0.1);
animateNow('shortp')

animatePlot(plot1,x,y);
animateNow('shortp')
videoArrow('$G(f)$',5.9,2.9,135,3)
animateNow('mediump')


plot([-4 4],[1 1],'r')

animateNow('shortp')
[xUB, yUB] = data2norm(-4.2,-3);
videoTextSmall({'$\underbrace{\phantom{textextextexttextextextextext}}$','\phantom{textextext}$\bar{x} \in [-4,4]$','\phantom{textext}set of minimizers'},[xUB yUB 0.1 0.1]);
animateNow('mediump')
videoArrow({'$\bar{y} = f(\bar{x}) = 1$', 'minimum'},0,1,135,2.5);




animateNow('endp')
end
