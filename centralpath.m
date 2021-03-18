%% %%%%%%%%%%%%%%%%%%%%%%% Central Path %%%%%%%%%%%%%%%%%%%%%%%%%%%
function centralpath
global FR
fig = figure('Position',[10 50 1280 720]);
videoTitle('Central Path');
animateNow('mediump')

problem(1) = videoText('${\rm min}\, f(x) = c^{\rm T}\,x = [\matrix{-2 & 1 & -3}]\,x$',[0 0.80 1 0.1],'center');
animateNow('mediump')
problem(2) = videoText('subject to',[0.18 0.75 1 0.1],'left');
animateNow('shortp')
problem(3) = videoText('$A(x)= A\,x -b = [\matrix{1&1&1}]\,x -1 = 0,\qquad C(x) = x\geq_e 0$',[0 0.7 1 0.1],'center');
animateNow('shortp')
drawLine([0.1 0.9],[0.72 0.72],0.5*FR)
animateNow('mediump')

f = @(x1,x2,x3) -2*x1+x2-3*x3;  % cost function
% A = @(x1,x2,x3) x1+x2+x3-1;     % equality constraint
A = [1 1 1];
c = [-2 1 -3]';
xmin = 0; ymin = 0; zmin = 1;
x=[];

for t=1:-.1:0 %some values for t=tau

%the equations to be solved      
syms x1 x2 x3 l m1 m2 m3 
s=solve(x1+x2+x3-1,...
    l+m1+2,...
    l+m2-1,...
    l+m3+3,...
    x1*m1-t,...
    x2*m2-t,...
    x3*m3-t);

x11=cast(s.x1,'double');
x22=cast(s.x2,'double');
x33=cast(s.x3,'double');
ll=cast(s.l,'double');
m11=cast(s.m1,'double');
m22=cast(s.m2,'double');
m33=cast(s.m3,'double');


%finding the feasible solutions for each t
for i=1:3
if  abs(imag(m11(i)))<10^(-5) && ...   
    abs(imag(m22(i)))<10^(-5) && ...   
    abs(imag(m33(i)))<10^(-5) && ...   
    real(m11(i))>0 && real(m22(i))>0 && real(m33(i))>0 && ... 
    real(x11(i))>0 && real(x22(i))>0 && real(x33(i))>0 
        x1=real(x11(i));
        x2=real(x22(i));
        x3=real(x33(i));
end
end

%the solutions (points on the central path)
x=[x ;x1 x2 x3];
s.x1;
s.x2;
s.x3;
s.l;
s.m1;
s.m2;
s.m3;

end

%%%%%%%%%%% plotting  %%%%%%%%%%%%


%plotting the constraint surface
ax = axes;
ax.Box = 'off';
ax.Position = [0 0 0.6 0.6];
ax.Color = 'none';
ax.TickLabelInterpreter = 'latex';
ax.XAxis.FirstCrossoverValue = 0;   % X crossover with Y axis
ax.XAxis.SecondCrossoverValue = 0;  % X crossover with Z axis
ax.YAxis.FirstCrossoverValue = 0;   % Y crossover with X axis
ax.YAxis.SecondCrossoverValue = 0;  % Y crossover with Z axis
ax.ZAxis.FirstCrossoverValue = 0;   % Z crossover with X axis
ax.ZAxis.SecondCrossoverValue = 0;  % Z crossover with Y axis
xlim([-0.3 1.3])
ylim([-0.3 1.3])
zlim([-0.3 1.3])
xticks(0:0.5:1)
yticks(0:0.5:1)
zticks(0:0.5:1)
hold on
axistip3(0.05,0.05,'x','x_1')
axistip3(0.05,0.05,'y','x_2')
axistip3(0.05,0.05,'z','x_3')
ax.DataAspectRatioMode = 'manual';
ax.PlotBoxAspectRatioMode = 'manual';
ax.CameraViewAngleMode = 'manual';
% ax.Clipping = 'off';
view([116.5 33.2])
camlight left
camlight left
animateNow('mediump')
[X,Y,Z] =meshgrid(linspace(0,2,15),linspace(0,2,15),linspace(0,2,15));
V = X+Y+Z-1; % evaluate your implicit function over the N-D grid
pconstraint = patch(isosurface(X,Y,Z,V,0),...
            'FaceVertexCData',0,...
            'FaceColor','g',...
            'EdgeColor','none',...
            'FaceAlpha',0.4);
[ha, ht, Xa, Ya, Za] = videoArrow3({'$A(x)=0$','$C(x)\geq_e 0$'},0.14,0.42,0.42,0.4,1,1,0.25,'vector');
delete(ha)
ha=arrow3d(Xa,Ya,Za,0.85,0.015/4,0.075/4,'k');


animateNow('shortp')
rotateCamera(ax,360,5*FR);
animateNow('shortp')
delete([ha ht])        
        
% plotting level surfaces of the cost function f
xx = -2:0.2:2;
yy=xx;
zz=xx;
[X,Y,Z] = meshgrid(xx,yy,zz);
levelsurface(1) = videoText('$f(x) = 0$',[0.55 0.55 1 0.1]);
levelsurface(2) = videoText('$f(x) = -1$',[0.55 0.5 1 0.1]);
levelsurface(3) = videoText('$f(x) = -2$',[0.55 0.45 1 0.1]);
levelsurface(4) = videoText('$f(x) = -3$',[0.55 0.4 1 0.1]);
set(levelsurface,'Color','none');
levelsurface(5) = videoText('Level surfaces of $f(x)$:',[0.5 0.6 1 0.1]);
level = 0:-1:-3;
colorlist = {'r','m','b',[0.9290    0.6940    0.1250]};
V = f(X,Y,Z);
for i=1:4
    p = patch(isosurface(X,Y,Z,V,level(i)),...
                'FaceColor',colorlist{i},...
                'EdgeColor','none',...
                'FaceAlpha',0.4);
            levelsurface(i).Color = colorlist{i}; 
            
    % draw line/point where the two planes intersect        
    if i ==4
        plot3(xmin,ymin,zmin,'.','MarkerSize',15,'color',colorlist{i})
    else
        b = [1;level(i)];
        a1=[A;c']\b;
        a2=[A;c';0 0 1]\[b;0];
        xl=[a1(1) a2(1)];
        yl=[a1(2) a2(2)];
        zl=[a1(3) a2(3)];
        plot3(xl,yl,zl,'color',colorlist{i},'linewidth',2)
    end
    animateNow('shortp')
    rotateCamera(ax,360,5*FR)
    animateNow('shortp')
    delete(p)
end
[ha, ht, Xa, Ya, Za] = videoArrow3('Minimizer',xmin,ymin,zmin,0.4,1,1,0.25,'vector');
delete(ha)
ha=arrow3d(Xa,Ya,Za,0.85,0.015/4,0.075/4,'k');
animateNow('mediump')

delete(levelsurface)
tauText = videoText('For $\tau\rightarrow 0$, solve:',[0.5 0.6 1 0.1]);
animateNow('shortp')
cpalg=videoText({'$A^{\rm T}\,\lambda+\mu=c,$',...
    '$A\,x=b,$',...
    '$X_{\tau}\,\mu=\tau\,e,$',...
    '$\qquad X_{\tau}={\rm diag}(x_1(\tau),\dots,x_n(\tau)),$',...
    '$\qquad e=(1,\dots,1),$',...
    '$x>_e 0,$',...
    '$\mu >_e 0.$'},...
    [0.55 0.52 1 0.1]);

animateNow('mediump')
t=1:-.1:0;
% plotting the central path
for i=1:length(x)-1
    tauText.String = ['For $\tau=' num2str(t(i)) '$, solve:'];
    cpalg.String{3} = ['$X_{\tau}\,\mu=' num2str(t(i)) '\,e,$'];
    plot3(double(x(i,1)),double(x(i,2)),double(x(i,3)),'r.','MarkerSize',12)
    animateNow('shortp')
end
rotateCamera(ax,360,5*FR,-10)
animateNow('endp')
end
