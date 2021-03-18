%% %%%%%%%%%%%%%%%%% Video 1: Weak Minimizers 3D (sombrero) %%%%%%%%%%%%%%%
function video1_p6
global FR
fig6 = figure('Position',[10 50 1280 720]);

videoTitle('Weak Minimizers of Multivariable Functions');
animateNow('mediump')

videoText('$f: R\mapsto {\rm I\!R}; \quad (x,y)\mapsto z = f(x,y) = |\sqrt{(x-2)^2+(y-2)^2}|+2, \quad R\subseteq{\rm I\!R}^2$',[0.1 0.8 1 0.1])
animateNow('mediump')
videoText('Graph of $f$: $G(f) = \{(x,y,z)\in{\rm I\!R}^3 \,|\, (x,y)\in R, z=f(x,y)\}$', [0.1 0.7 1 0.1])
animateNow('shortp');
drawLine([0.1 0.9],[0.72 0.72],0.5*FR)
animateNow('mediump')

videoText('$R = {\rm I\!R}^2$', [0.1 0.6 1 0.1])

animateNow('mediump')


x = -4:.1:8;
y = -4:.1:8;
[X,Y] = meshgrid(x,y);
f=@(x,y) abs(sqrt((x-2).^2+(y-2).^2)-2)+2;
Z = f(X,Y);

ax = axes;
ax.Box = 'off';
ax.OuterPosition = [0.05 0.12 0.6 0.5];
ax.Color = 'none';
ax.ZColor = 'none';
ax.TickLabelInterpreter = 'latex';
ax.XAxis.FirstCrossoverValue = 0;   % X crossover with Y axis
ax.XAxis.SecondCrossoverValue = 0;  % X crossover with Z axis
ax.YAxis.FirstCrossoverValue = 0;   % Y crossover with X axis
ax.YAxis.SecondCrossoverValue = 0;  % Y crossover with Z axis
ax.ZAxis.FirstCrossoverValue = 0;   % Z crossover with X axis
ax.ZAxis.SecondCrossoverValue = 0;  % Z crossover with Y axis
xlim([-2 6])
ylim([-2 6])
zlim([0 4])
xticks([-1 0 1 2 3 4 5])
yticks([-1 0 1 2 3 4 5])
zticks([0 1 2 3])
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
videoArrow3('$R$',-0.8,-1.5,0,-1,-1,1,1,'vector');

animateNow('mediump')
ax.ZColor = ax.XColor;
axistip3(0.2,0.2,'z')

animateNow('mediump');
[C,h] = contour(X,Y,Z);
set(h,'ShowText','on','TextStep',get(h,'LevelStep')*1)
hold on

colormap parula % winter
caxis([0 30])
surf(X,Y,Z,'FaceColor','interp',...
   'EdgeColor','none',...
   'FaceLighting','gouraud')
camlight left
camlight left

rotateCamera([ax invax],360,4*FR)

% show set of minimizers
tmin = nonLinspace(0,2*pi+0.1,2*FR,'cos');
xmin = 2*cos(tmin)+2;
ymin = 2*sin(tmin)+2;
zmin = f(xmin,ymin);

plot3(xmin,ymin,zmin,'r','LineWidth',2)
animateNow('mediump');
plot3(xmin,ymin,zmin*0,'r','LineWidth',2)

%move arrow along circle
for i = 1:length(xmin)-1
    if i>1
        delete([ha ht]);
    end
    dir = [xmin(i+1)-xmin(i); ymin(i+1)-ymin(i)]/norm([xmin(i+1)-xmin(i); ymin(i+1)-ymin(i)]);
    [ha, ht] = videoArrow3('Set of minimizers',xmin(i),ymin(i),zmin(i)*0,dir(2),-dir(1),0.67,1,'vector');
    animateNow(1)
end
animateNow('shortp');

% show minimum
rotateCamera([ax invax],60,3*FR)

[a, b] = min(sum([xmin.^2;ymin.^2],1)); % find the point on the circle closest to origin
dashedLine3([xmin(b+3) 0],[ymin(b+3) 0],[zmin(b) zmin(b)],1*FR);
videoArrow3('Minimum',0,0,zmin(b),270,1);

animateNow('endp');
end
