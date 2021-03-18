 %% %%%%%%%%%%%%%%%% Video 1: Minimizers 3D %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function video1_p5
global FR
fig5 = figure('Position',[10 50 1280 720]);

videoTitle('Minimizers and Minima of Multivariable Functions');
animateNow('mediump')

videoText('$f: R\mapsto {\rm I\!R}; \quad (x,y)\mapsto z = f(x,y) = (x-2)^2+(y-2)^2 +2, \quad R\subseteq{\rm I\!R}^2$',[0.1 0.8 1 0.1])
animateNow('mediump')
videoText('Graph of $f$: $G(f) = \{(x,y,z)\in{\rm I\!R}^3 \,|\, (x,y)\in R, z=f(x,y)\}$', [0.1 0.7 1 0.1])
animateNow('shortp')
drawLine([0.1 0.9],[0.72 0.72],0.5*FR)
animateNow('mediump')
videoText('$R = {\rm I\!R}^2$', [0.1 0.6 1 0.1])

animateNow('mediump')


x = -2:.2:5;
y = -2:.2:5;
[X,Y] = meshgrid(x,y);
f=@(x,y) (x-2).^2+(y-2).^2 + 2;
Z = f(X,Y);

xmin = 2;
ymin = 2;
zmin = 2;

ax = axes;
ax.Box = 'off';
ax.OuterPosition = [0.05 0.1 0.6 0.5];
ax.Color = 'none';
ax.ZColor = 'none';
ax.TickLabelInterpreter = 'latex';
ax.XAxis.FirstCrossoverValue = 0;   % X crossover with Y axis
ax.XAxis.SecondCrossoverValue = 0;  % X crossover with Z axis
ax.YAxis.FirstCrossoverValue = 0;   % Y crossover with X axis
ax.YAxis.SecondCrossoverValue = 0;  % Y crossover with Z axis
ax.ZAxis.FirstCrossoverValue = 0;   % Z crossover with X axis
ax.ZAxis.SecondCrossoverValue = 0;  % Z crossover with Y axis
xlim([-1.9 4.9])
ylim([-1.9 4.9])
zlim([0 4.9])
xticks([-1 0 1 2 3 4])
yticks([-1 0 1 2 3 4])
zticks([0 1 2 3 4])
ax.DataAspectRatioMode = 'manual';
ax.PlotBoxAspectRatioMode = 'manual';
ax.CameraViewAngleMode = 'manual';
ax.View = [76.4 22.8];
ax.CameraPosition = [41.3 -6.9 19.3];
ax.CameraTarget = [2.5 2.5 2.5];
ax.CameraViewAngle = 6;
hold on
axistip3(0.2,0.2,'x')
axistip3(0.2,0.2,'y')

animateNow('mediump')
invax = invisibleAxis(ax);
hold on
f3=fill3([-10 10 10 -10],[-10 -10 10 10], [0 0 0 0],[0.5 1 0.5]);
axes(ax);
videoArrow3('$R$',-1.5,-1.5,0,-1,-1,1,1,'vector');

animateNow('mediump')
ax.ZColor = ax.XColor;
axistip3(0.2,0.2,'z')
animateNow('mediump')

[C,h] = contour(X,Y,Z);
set(h,'ShowText','on','TextStep',get(h,'LevelStep')*2)
hold on

colormap parula % winter
surf(X,Y,Z,'FaceColor','interp',...
   'EdgeColor','none',...
   'FaceLighting','gouraud')
camlight left
camlight left
% camlight('headlight')
% lighting flat

animateNow('shortp')
videoArrow3('$G(f)$',3.4,2.6,4.3,90,1);

% animateNow('shortp')

plot3(xmin,ymin,zmin,'r.','MarkerSize',10);



rotateCamera([ax invax],360,4*FR)



dashedLine3([xmin xmin],[ymin ymin],[zmin 0],1*FR);
plot3(xmin,ymin,0,'r.','MarkerSize',10);
dashedLine3([xmin xmin;xmin 0],[ymin 0;ymin ymin],[0 0; 0 0],1*FR,2);
videoArrow3({'$(\bar{x},\bar{y})=(2,2)$','minimizer'},xmin,ymin,0,45,1);

animateNow('mediump');

dashedLine3([xmin 0],[ymin 0],[zmin zmin],1*FR);
videoArrow3({'$\bar{z}=f(\bar{x},\bar{y})=2$','minimum'},0,0,zmin,270,1);

animateNow('mediump');
%%%%%%%%%%%%%%%%%%%%% Plot2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% feasible region
videoText('$R = \{(x,y)\in{\rm I\!R}^2 \,|\, y \leq 2.5-x\}$', [0.5 0.6 1 0.1])
R = @(x) 2.5-x;

ax = axes;
ax.Box = 'off';
ax.OuterPosition = [0.5 0.1 0.6 0.5];
ax.Color = 'none';
ax.ZColor = 'none';
ax.TickLabelInterpreter = 'latex';
ax.XAxis.FirstCrossoverValue = 0;   % X crossover with Y axis
ax.XAxis.SecondCrossoverValue = 0;  % X crossover with Z axis
ax.YAxis.FirstCrossoverValue = 0;   % Y crossover with X axis
ax.YAxis.SecondCrossoverValue = 0;  % Y crossover with Z axis
ax.ZAxis.FirstCrossoverValue = 0;   % Z crossover with X axis
ax.ZAxis.SecondCrossoverValue = 0;  % Z crossover with Y axis
xlim([-1.9 4.9])
ylim([-1.9 4.9])
zlim([0 4.9])
xticks([-1 0 1 2 3 4])
yticks([-1 0 1 2 3 4])
zticks([0 1 2 3 4])
ax.DataAspectRatioMode = 'manual';
ax.PlotBoxAspectRatioMode = 'manual';
ax.CameraViewAngleMode = 'manual';
ax.View = [76.4 22.8];
ax.CameraPosition = [41.3 -6.9 19.3];
ax.CameraTarget = [2.5 2.5 2.5];
ax.CameraViewAngle = 6;
hold on
axistip3(0.2,0.2,'x')
axistip3(0.2,0.2,'y')

animateNow('mediump')
invax = invisibleAxis(ax);
hold on
f32=fill3([-10 10 -10 -20],[R(-10) R(10) -R(-10) R(-20)], [0 0 0 0],[0.5 1 0.5],...
    'EdgeColor','none');
axes(ax);
videoArrow3('$R$',-1.5,-1.5,0,-1,-1,1,1,'vector');

animateNow('mediump')

ax.ZColor = ax.XColor;
axistip3(0.2,0.2,'z')

animateNow('mediump')

% generate plot data
x = [-2:0.2:0 0:0.01:2.5 2.5:0.2:5]; % partitioned to have better resolution around the edge of the feasible region
y = [-2:0.2:0 0:0.01:2.5 2.5:0.2:5];

[X1,Y1] = meshgrid(x,y);
[X2,Y2] = meshgrid(x,y);

f=@(x,y) (x-2).^2+(y-2).^2 + 2;
Z1 = f(X1,Y1);
Z2 = f(X2,Y2);

out1 = Y1<=R(X1);
out2 = Y1>R(X1);

X1(out1) = nan;
Y1(out1) = nan;
Z1(out1) = nan;

X2(out2) = nan;
Y2(out2) = nan;
Z2(out2) = nan;

% contour and surface plots
colormap parula
[C,h2] = contour(X2,Y2,Z2);
set(h2,'ShowText','on','TextStep',get(h2,'LevelStep')*2)

[C,h1] = contour(X1,Y1,Z1,'k:');
set(h1,'ShowText','on','TextStep',get(h2,'LevelStep')*2, 'LevelStep',get(h2,'LevelStep'))


% s = surf(X1,Y1,Z1,'FaceColor','none',...
%     'LineStyle',':',...
%    'FaceLighting','gouraud');

surf(X2,Y2,Z2,'FaceColor','interp',...
   'EdgeColor','none',...
   'FaceLighting','gouraud');

camlight left
camlight left


% surface plot outside feasible region
numlines = [8 10 10]; % total number of lines in mesh: 2.5*2*7/12.5*10=28
[X1nonan,Y1nonan] = meshgrid(x,y);
Z1nonan = f(X1nonan,Y1nonan);
meshLinesPartition(X1nonan,Y1nonan,Z1nonan,numlines,X1,Y1,Z1);



animateNow('shortp')
videoArrow3('$G(f)$',0.5,1.6,4.3,90,1);

xmin = 1.25;
ymin = 1.25;
zmin = f(xmin,ymin);
plot3(xmin,ymin,zmin,'r.','MarkerSize',10);

rotateCamera([ax invax],360,4*FR)

dashedLine3([xmin xmin],[ymin ymin],[zmin 0],1*FR);
plot3(xmin,ymin,0,'r.','MarkerSize',10);
dashedLine3([xmin xmin;xmin 0],[ymin 0;ymin ymin],[0 0; 0 0],1*FR,2);
videoArrow3('minimizer',xmin,ymin,0,45,1);

animateNow('mediump');

dashedLine3([xmin 0],[ymin 0],[zmin zmin],1*FR);
videoArrow3('minimum',0,0,zmin,270,1);


animateNow('endp')
end
