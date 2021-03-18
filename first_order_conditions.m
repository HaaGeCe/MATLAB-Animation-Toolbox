 %% %%%%%%%%%%%%%%%% Video 2: First Order Necessary Conditions %%%%%%%%%%%%
function first_order_conditions
global FR
fig7 = figure('Position',[10 50 1280 720]);

videoTitle('First-Order Necessary Conditions');
animateNow('mediump')

videoText('$f: R\mapsto {\rm I\!R}; \quad (x_1,x_2)\mapsto x_3 = f(x_1,x_2) = (x_1-2)^2+(x_2-2)^2 +2, \quad R\subseteq{\rm I\!R}^2$',[0.1 0.8 1 0.1])
animateNow('mediump')
videoText('Graph of $f$: $G(f) = \{(x_1,x_2,x_3)\in{\rm I\!R}^3 \,|\, (x_1,x_2)\in R, x_3=f(x_1,x_2)\}$', [0.1 0.7 1 0.1])
animateNow('shortp')
drawLine([0.1 0.9],[0.72 0.72],0.5*FR)
animateNow('mediump')
h_R = videoText('$R = {\rm I\!R}^2$', [0.1 0.6 1 0.1]);

animateNow('mediump')



x = -2:.2:5;
y = -2:.2:5;
[X,Y] = meshgrid(x,y);
f=@(x,y) (x-2).^2+(y-2).^2 + 2;
g = @(x,y) [2*x-4; 2*y-4]; % gradient
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
axistip3(0.2,0.2,'x','x_1')
axistip3(0.2,0.2,'y','x_2')

animateNow('mediump')
invax = invisibleAxis(ax);
hold on
f3=fill3([-10 10 10 -10],[-10 -10 10 10], [0 0 0 0],[0.5 1 0.5]);
axes(ax);
[ha_R ht_R] = videoArrow3('$R$',-1.5,-1.5,0,-1,-1,1,1,'vector');

animateNow('mediump')
ax.ZColor = ax.XColor;
axistip3(0.2,0.2,'z','x_3')
animateNow('mediump')

[C,h] = contour(X,Y,Z);
set(h,'ShowText','on','TextStep',get(h,'LevelStep')*2)
hold on

colormap parula % winter
s=surf(X,Y,Z,'FaceColor','interp',...
   'EdgeColor','none',...
   'FaceLighting','gouraud');
camlight left
camlight left

animateNow('shortp')
[ha_G, ht_G] = videoArrow3('$G(f)$',3.4,2.6,4.3,90,1);
animateNow('mediump')

% point #1 and theorem
xp = -0.8;
yp = 1.6;
p=plot3(xp,yp,0,'r.','MarkerSize',10);
animateNow('mediump')
gp = g(xp,yp);
gp = gp/norm(gp);

%tangent plane
tp = plot([gp(2) -gp(2)]*10+xp, [-gp(1) gp(1)]*10+yp,'k');
% tptxt = videoTextSmall({'Tangent space of $\bar{x}$', 'at the level surface'},[0.43 0.22 0.1 0.1]);
[ha_tp ht_tp] = videoArrow3({'Tangent space of $\bar{x}$', 'at the level surface'},-1.1,4,0,-1,1,1,1,'vector');
animateNow('mediump')


%gradient with perpendicular angle
xpp1 = xp+0.2*gp(1);
ypp1 = yp+0.2*gp(2);
tpangle = plot([0 gp(2)]*0.2+xpp1, [0 -gp(1)]*0.2+ypp1,...
    [gp(2)*0.2+xpp1 gp(2)*0.2+xp], [-gp(1)*0.2+ypp1 -gp(1)*0.2+yp],...
    'Color','k','linewidth',0.1);
[hga, hgt] = videoArrow3('$\nabla f(\bar{x})$',xp,yp,0,gp(1),gp(2),0,1,'gradient');

animateNow('mediump')
videoText({'Gradient of $f$: $\nabla f(\bar{x})$'},[0.55 0.6 0.1 .1]);
animateNow('mediump')

% delete([tp tptxt tpangle'])
delete([tp ha_tp ht_tp tpangle'])
videoText({'Feasible direction: $d$'},[0.55 0.55 0.1 .1]);
[ha, ht] = rotateArrow3('$d$',[xp -2],[yp -1],[0 0],0,0,360,1,2*FR);
animateNow('mediump')

videoText('If $\bar{x}$ is a (local) minimizer, then',[0.55 0.45 0.1 .1]);
animateNow('shortp')
videoText({'$0 \leq \nabla f(\bar{x})\cdot d$'},[0.6 0.4 0.1 .1],'left');
animateNow('mediump')
videoText('or, equivalently,',[0.55 0.35 0.1 .1]);
animateNow(0.5*FR)
hcos = videoText('$0 \leq |\nabla f(\bar{x})| \cdot |d| \cdot \cos(\theta)$',[0.6 0.3 0.1 .1]);
animateNow('mediump')
 
Ntheta = 6*FR;
phi_end = 360;
X = [xp -2];
Y = [yp -1];
Z = [0 0];
htheta = videoTextSmall('$\theta=THETA^\circ$', [0.3 0.2 0.1 .1]);
hcos.String = '$0 \leq |\nabla f(\bar{x})| \cdot |d| \cdot \cos(THETA^\circ)=DOTPRODUCT$';
delete([ha ht])
hNotAMinimizer = videoText('Hence, not a minimizer.',[0.55 0.25 0.1 .1],'left');
hNotAMinimizer.Color = 'none';
[ha, ht, cur] = rotateArrowWithAngleUpdate('$d$',X,Y,Z,gp,phi_end,Ntheta,[htheta hcos hNotAMinimizer],{'THETA','THETA DOTPRODUCT','NOTAMINIMIZER'},5);
animateNow('shortp')
htheta.String = {'Not a minimizer'};
animateNow('longp')

% point #2
delete([ha ht cur p htheta hga hgt hNotAMinimizer])

xp = 3;
yp = 3.5;
p=plot3(xp,yp,0,'r.','MarkerSize',10);
gp = g(xp,yp);

Ntheta = 6*FR;
phi_end = 360;
X = [xp 10];
Y = [yp 0];
Z = [0 0];

[hga, hgt] = videoArrow3('$\nabla f(\bar{x})$',xp,yp,0,gp(1),gp(2),0,1,'gradient');
animateNow('mediump')
[ha, ht] = videoArrow3('$d$',X(1),Y(1),Z(1),X(2)-X(1),Y(2)-Y(1),Z(2)-Z(1),1,'gradient');

animateNow('shortp')
delete([ha ht])
htheta = videoTextSmall('$\theta=THETA^\circ$', [0.4 0.13 0.1 .1]);
hcos.String = '$0 \leq |\nabla f(\bar{x})| \cdot |d| \cdot \cos(THETA^\circ)=DOTPRODUCT$';
hNotAMinimizer = videoText('Hence, not a minimizer.',[0.55 0.25 0.1 .1],'left');
hNotAMinimizer.Color = 'none';
[ha, ht, cur] = rotateArrowWithAngleUpdate('$d$',X,Y,Z,gp,phi_end,Ntheta,[htheta hcos hNotAMinimizer],{'THETA','THETA DOTPRODUCT','NOTAMINIMIZER'},5);


animateNow('shortp')
htheta.String = {'Not a minimizer'};
animateNow('longp')

% point #3 (minimum)
delete([ha ht cur p htheta hga hgt hNotAMinimizer])
animateNow('mediump')

xp = xmin;
yp = ymin;
p=plot3(xp,yp,0,'r.','MarkerSize',10);
gp = g(xp,yp);

Ntheta = 6*FR;
phi_end = 360;
X = [xp 0];
Y = [yp 6];
Z = [0 0];

[hga, hgt] = videoArrow3('$\nabla f(\bar{x})=0$',xp,yp,0,gp(1),gp(2),-1,1e-5,'gradient');
animateNow('mediump')

htheta = videoTextSmall('$\theta=THETA^\circ$', [0.32 0.06 0.1 .1]);
hcos.String = '$0 \leq |\nabla f(\bar{x})| \cdot |d| \cdot \cos(THETA^\circ)=0$';
% hNotAMinimizer = videoText('Hence, not a minimizer.',[0.55 0.25 0.1 .1],'left');
% hNotAMinimizer.Color = 'none';
[ha, ht, cur] = rotateArrowWithAngleUpdate('$d$',X,Y,Z,[X(2)-X(1) Y(2)-Y(1)],phi_end,Ntheta,[htheta hcos],{'THETA','THETA'},5,'recolor','black');


% [ha, ht] = rotateArrow3('$d$',X,Y,Z,0,0,360,1,2*FR);

hdownarrow=videoText({'$\Downarrow$'},[0.55 0.25 0.1 .1],'left');
animateNow(0.5*FR)
hintR=videoText({'$\nabla f(\bar{x})= 0$ \quad if $\bar{x} \in \rm{int}(R)$'},[0.6 0.2 0.1 .1],'left');

animateNow('mediump')
hMinimizer=videoText({'Hence, a minimizer.'},[0.55 0.15 0.1 .1],'left');
animateNow('shortp')
delete([ha ht])
htheta.String = 'Minimizer';
% [ha, ht, cur] = rotateArrowWithAngleUpdate('$d$',X,Y,Z,gp,phi_end,Ntheta,htheta);

animateNow('longp')


delete([s h f3 ha_G ha_R ht_G ht_R h_R htheta hMinimizer hga hgt p hdownarrow hintR])

%%%%%%%%%%%%%%%%%%%%% Plot2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

animateNow('mediump')

% feasible region
videoText('$R = \{(x_1,x_2)\in{\rm I\!R}^2 \,|\, x_2 \leq 2.5-x_1\}$', [0.1 0.6 1 0.1])
R = @(x) 2.5-x;

animateNow('shortp')
axes(invax);
hold on
f32=fill3([-10 10 -10 -20],[R(-10) R(10) -R(-10) R(-20)], [0 0 0 0],[0.5 1 0.5],...
    'EdgeColor','none');
axes(ax);
videoArrow3('$R$',-1.5,-1.5,0,-1,-1,1,1,'vector');

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
animateNow('mediump')

% point #1

xp = -1;
yp = 1.5;
p=plot3(xp,yp,0,'r.','MarkerSize',10);
gp = g(xp,yp);
Ntheta = 6*FR;
phi_end = 360;
X = [xp -2];
Y = [yp -1];
Z = [0 0];

% animateNow('mediump')
[hga, hgt] = videoArrow3('$\nabla f(\bar{x})$',xp,yp,0,gp(1),gp(2),0,1,'gradient');
animateNow('mediump')
[ha, ht] = videoArrow3('$d$',X(1),Y(1),Z(1),X(2)-X(1),Y(2)-Y(1),Z(2)-Z(1),1,'gradient');



animateNow('shortp')

htheta = videoTextSmall('$\theta=THETA^\circ$', [0.3 0.2 0.1 .1]);
hcos.String = '$0 \leq |\nabla f(\bar{x})| \cdot |d| \cdot \cos(THETA^\circ)=DOTPRODUCT$';
delete([ha ht])
hNotAMinimizer = videoText('Hence, not a minimizer.',[0.55 0.25 0.1 .1],'left');
hNotAMinimizer.Color = 'none';
[ha, ht, cur] = rotateArrowWithAngleUpdate('$d$',X,Y,Z,gp,phi_end,Ntheta,[htheta hcos hNotAMinimizer],{'THETA','THETA DOTPRODUCT','NOTAMINIMIZER'},5);
animateNow('shortp')
htheta.String = {'Not a minimizer'};
animateNow('longp')


delete([ha ht cur p htheta hga hgt hNotAMinimizer])

% point #2 (on boundary, not a mimimizer)

xp = 3;
yp = -0.5;
p=plot3(xp,yp,0,'r.','MarkerSize',10);
gp = g(xp,yp);
X = [xp 0];
Y = [yp -3];
Z = [0 0];
d0 = [X(2)-X(1); Y(2)-Y(1)];
phi_end1 = -abs(acosd(dot(d0,gp)/(norm(d0)*norm(gp))) -acosd(dot([-1; 1],gp)/(norm([-1; 1])*norm(gp))));
phi_end2 = 180;
Ntheta1 = abs(6*FR*phi_end1/180);
Ntheta2 = 6*FR*phi_end2/180;

[hga, hgt] = videoArrow3('$\nabla f(\bar{x})$',xp,yp,0,gp(1),gp(2),0,1,'gradient');
animateNow('mediump')
[ha, ht] = videoArrow3('$d$',X(1),Y(1),Z(1),X(2)-X(1),Y(2)-Y(1),Z(2)-Z(1),1,'gradient');

animateNow('shortp')

htheta = videoTextSmall('$\theta=THETA^\circ$', [0.14 0.07 0.1 .1]);
hcos.String = '$0 \leq |\nabla f(\bar{x})| \cdot |d| \cdot \cos(THETA^\circ)=DOTPRODUCT$';
delete([ha ht])
hNotAMinimizer = videoText('Hence, not a minimizer.',[0.55 0.25 0.1 .1],'left');
hNotAMinimizer.Color = 'none';
[ha, ht, cur] = rotateArrowWithAngleUpdate('$d$',X,Y,Z,gp,phi_end1,Ntheta1,[htheta hcos hNotAMinimizer],{'THETA','THETA DOTPRODUCT','NOTAMINIMIZER'},5);
delete([ha, ht, cur])
hcos.String = '$0 \leq |\nabla f(\bar{x})| \cdot |d| \cdot \cos(THETA^\circ)=DOTPRODUCT$';
htheta.String = '$\theta=THETA^\circ$';
[ha, ht, cur] = rotateArrowWithAngleUpdate('$d$',[xp 2.5],[yp 0],Z,gp,phi_end2,Ntheta2,[htheta hcos hNotAMinimizer],{'THETA','THETA DOTPRODUCT','NOTAMINIMIZER'},5);


animateNow('shortp')
htheta.String = {'Not a minimizer'};
animateNow('longp')


delete([ha ht cur p htheta hga hgt hNotAMinimizer])



% point #3 (minimizer on boundary)

animateNow('mediump')
xmin = 1.25;
ymin = 1.25;
zmin = f(xmin,ymin);

xp = xmin;
yp = ymin;
p=plot3(xp,yp,0,'r.','MarkerSize',10);
gp = g(xp,yp);

Ntheta1 = 3*FR;
Ntheta2 = 6*FR;
phi_end1 = 90;
phi_end2 = -180;
X = [xp 0];
Y = [yp 0];
Z = [0 0];

[hga, hgt] = videoArrow3('$\nabla f(\bar{x})$',xp,yp,0,gp(1),gp(2),0,1,'gradient');
animateNow('mediump')
[ha, ht] = videoArrow3('$d$',X(1),Y(1),Z(1),X(2)-X(1),Y(2)-Y(1),Z(2)-Z(1),1,'gradient');

% animateNow('shortp')
htheta = videoTextSmall('$\theta=THETA^\circ$', [0.31 0.12 0.1 .1]);
hcos.String = '$0 \leq |\nabla f(\bar{x})| \cdot |d| \cdot \cos(THETA^\circ)=DOTPRODUCT$';
delete([ha ht])
[ha, ht, cur] = rotateArrowWithAngleUpdate('$d$',X,Y,Z,gp,phi_end1,Ntheta1,[htheta hcos],{'THETA','THETA DOTPRODUCT'},5);
delete([ha, ht, cur])
hcos.String = '$0 \leq |\nabla f(\bar{x})| \cdot |d| \cdot \cos(THETA^\circ)=DOTPRODUCT$';
htheta.String = '$\theta=THETA^\circ$';
[ha, ht, cur] = rotateArrowWithAngleUpdate('$d$',[xp 2.5],[yp 0],Z,gp,phi_end2,Ntheta2,[htheta hcos],{'THETA','THETA DOTPRODUCT'},5);
animateNow('shortp')
hMinimizer=videoText({'Hence, a minimizer.'},[0.55 0.25 0.1 .1],'left');
htheta.String = {'Minimizer'};

animateNow('endp')
end
