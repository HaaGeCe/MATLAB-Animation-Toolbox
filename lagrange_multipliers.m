%% %%%%%%%%%%%%%%%%%%%% Lagrange Multipliers %%%%%%%%%%%%%%%%%%%%%%%%%%%
function lagrange_multipliers
global FR
fig = figure('Position',[10 50 1280 720]);

% full problem statement
videoTitle('Lagrange Multipliers');
animateNow('mediump')
fullproblem(1) = videoText('$f: R\mapsto {\rm I\!R}^4; \quad (x_1,x_2,x_3)\mapsto x_4 = f(x_1,x_2,x_3) = x_1^2+x_2^2 + \frac{1}{4}\,x_3^2, \quad R\subseteq{\rm I\!R}^3$',[0.1 0.8 1 0.1]);
animateNow('mediump')
fullproblem(2) = videoText('$R = \{x\in {\rm I\!R}^3 \, |\, A(x) = 0\}$', [0.1 0.7 1 0.1]);
animateNow('mediump')
fullproblem(3) = videoText('$A(x) = \Big[\matrix{a_1(x) \cr a_2(x)}\Big] = \Big[\matrix{-x_1+x_3-1 \cr x_1^2+x_2^2-2\,x_1}\Big]$', [0.1 0.6 1 0.1]);
animateNow('mediump')
fullproblem(4) = videoText('In short,',[0.2 0.45 1 0.1]);
animateNow('shortp')
problem(1) = videoText('${\rm min}\, f(x) = x_1^2+x_2^2 + \frac{1}{4}\,x_3^2$',[0 0.40 1 0.1],'center');
problem(2) = videoText('subject to',[0.2 0.35 1 0.1],'left');
problem(3) = videoText('$a_1(x) = -x_1+x_3-1=0$,\quad $a_2(x) = x_1^2+x_2^2-2\,x_1=0$',[0 0.3 1 0.1],'center');
animateNow('mediump')
delete(fullproblem)

% short problem statement
moveAnnotation(problem,[0 0.4],2*FR);
animateNow('shortp')
drawLine([0.1 0.9],[0.72 0.72],0.5*FR)
animateNow('mediump')

% various text boxes, used later in the code
Tpdef(1) = videoText('Tangent planes:', [0.5 0.55 1 0.1]);
Tpdef(2) = videoText('$T_{\bar{x}}f = \{x\in {\rm I\!R}^n \, |\, \nabla f(\bar{x})^{\rm T} (x-\bar{x})=0\}$', [0.55 0.5 1 0.1]);
Tpdef(3) = videoText('$T_{\bar{x}}A = \{x\in {\rm I\!R}^n \, |\, J(\bar{x}) (x-\bar{x})=0\}$', [0.55 0.45 1 0.1]);

Npdef(1) = videoText('Normal spaces:', [0.5 0.35 1 0.1]);
Npdef(2) = videoText('$N_{\bar{x}}f = \{x\in {\rm I\!R}^n \, |\, x=\alpha\,\nabla f(\bar{x})+\bar{x}, \alpha\in {\rm I\!R}\}$', [0.55 0.3 1 0.1]);
Npdef(3) = videoText('$N_{\bar{x}}A = {\rm range}(J(\bar{x}))+\bar{x}$', [0.55 0.25 1 0.1]);

gradients(1) = videoText('Gradient of $f$: $\nabla f(\bar{x})$', [0.55 0.55 1 0.1]);
gradients(2) = videoText('Jacobian of $A$: $J(\bar{x}) = [\nabla a_1(\bar{x})\quad \nabla a_2(\bar{x})]^{\rm T}$', [0.55 0.5 1 0.1]);

minimizer(1) = videoText('If $\bar{x}$ is a regular minimizer, then', [0.55 0.55 1 0.1]);
minimizer(2) = videoText('$N_{\bar{x}}f$ is contained in \phantom{m} $N_{\bar{x}}A$,', [0.6 0.5 1 0.1]);
minimizer(3) = videoText('implying,', [0.55 0.45 1 0.1]);
minimizer(4) = videoText('$$\nabla f(\bar{x}) = J(\bar{x})^{\rm T}\,\bar{\lambda} = \sum \bar{\lambda}_i\,\nabla a_i(\bar{x})$$', [0.6 0.4 1 0.1]);

notethat(1) = videoText('Note that', [0.55 0.55 1 0.1]);
notethat(2) = videoText('$N_{\bar{x}}f$ is contained in \phantom{m} $N_{\bar{x}}A$,', [0.6 0.5 1 0.1]);
notethat(3) = videoText('implying,', [0.55 0.45 1 0.1]);
notethat(4) = videoText('$$\nabla f(\bar{x}) = J(\bar{x})^{\rm T}\,\bar{\lambda} = \sum \bar{\lambda}_i\,\nabla a_i(\bar{x})$$.', [0.6 0.4 1 0.1]);
notethat(5) = videoText('This is true when $\bar{x}$ is a minimizer', [0.55 0.3 1 0.1]);
notethat(6) = videoText('candidate.', [0.55 0.25 1 0.1]);

% legends
Tpleg(1) = annotation('rectangle',[0.525 0.615-0.05 0.02 0.02],'Color','none','FaceColor','b','FaceAlpha',0.4);
Tpleg(2) = annotation('rectangle',[0.525 0.615+0.0075-0.05-0.05 0.02 0.005],'Color','none','FaceColor','r');
Npleg(1) = annotation('rectangle',[0.525 0.415+0.0075-0.05 0.02 0.005],'Color','none','FaceColor','b');
Npleg(2) = annotation('rectangle',[0.525 0.415-0.05-0.05 0.02 0.02],'Color','none','FaceColor','r','FaceAlpha',0.4);

Nplegthrm(1) = annotation('rectangle',[0.585 0.615+0.0075-0.05 0.02 0.005],'Color','none','FaceColor','b');
Nplegthrm(2) = annotation('rectangle',[0.81 0.615-0.05 0.02 0.02],'Color','none','FaceColor','r','FaceAlpha',0.4);

set([gradients Tpdef Npdef minimizer notethat],'Color','none')
set([Tpleg Npleg Nplegthrm],'FaceColor','none')

% generate 3D axis
ax = axes;
ax.Box = 'off';
ax.Position = [0 0.05 0.5 0.5];
ax.Color = 'none';
ax.TickLabelInterpreter = 'latex';
ax.XAxis.FirstCrossoverValue = 0;   % X crossover with Y axis
ax.XAxis.SecondCrossoverValue = 0;  % X crossover with Z axis
ax.YAxis.FirstCrossoverValue = 0;   % Y crossover with X axis
ax.YAxis.SecondCrossoverValue = 0;  % Y crossover with Z axis
ax.ZAxis.FirstCrossoverValue = 0;   % Z crossover with X axis
ax.ZAxis.SecondCrossoverValue = 0;  % Z crossover with Y axis
xlim([-4 4])
ylim([-4 4])
zlim([-4 4])
xticks(-3:1:3)
yticks(-3:1:3)
zticks(-3:1:3)
ax.DataAspectRatioMode = 'manual';
ax.PlotBoxAspectRatioMode = 'manual';
ax.CameraViewAngleMode = 'manual';
hold on
axistip3(0.2,0.2,'x','x_1')
axistip3(0.2,0.2,'y','x_2')
axistip3(0.2,0.2,'z','x_3')
ax.Clipping = 'off';
view(3)
camlight left
camlight left

% function and gradient definitions
f = @(x,y,z) x.^2+y.^2+1/4*z.^2; % function
gf = @(x,y,z) [2*x; 2*y; 1/2*z]; % gradient of function
J = @(x,y,z) [-1 2*x-2; 0 2*y; 1 0]; % Jacobian of equality constraints

animateNow('mediump')


% constraint plots
%constraint a2
[Xa2, Ya2, Za2] = cylinder(1);
a2=surf(Xa2+1,Ya2,Za2*12-6,'FaceColor','g',...
   'EdgeColor','none',...
   'FaceLighting','gouraud',...
   'FaceAlpha',0.4);
[a2a, a2t] = videoArrow3('$a_2(x)=0$',1,-1,3,1,-1,1,1,'vector','right');
animateNow('shortp')
rotateCamera(ax,360,5*FR)
animateNow('mediump')

%constraint a1
delete([a2a a2t])
xa1 = -3:0.2:3;
ya1 = xa1;
[Xa1,Ya1] = meshgrid(2*xa1,2*ya1);
Za1 = Xa1+1;
a1=surf(Xa1,Ya1,Za1,'FaceColor','g',...
   'EdgeColor','none',...
   'FaceLighting','gouraud',...
   'FaceAlpha',0.4);
[a1a, a1t] = videoArrow3('$a_1(x)=0$',0.4,2.6,1.4,-2,-0.5,-0.5,1,'vector');
xa = cos(linspace(0,2*pi,pi*10)) + 1;
ya = sin(linspace(0,2*pi,pi*10));
za = xa+1;
plot3(xa,ya,za,'g','LineWidth',1.5)
animateNow('shortp')
rotateCamera(ax,360,5*FR,-50)
animateNow('mediump')

%constraints combined
delete([a1 a1a a1t a2])
[Aa, At] = videoArrow3('$A(x)=0$',1.8,-0.5,2.8,2,-1,1,1,'vector');
animateNow('mediump')

% 3D contours of 4D function
delete([Aa At])
levellist = [0.1 0.25 3 6.25];
levelsurface(1) = videoText('$f(x) = 0.1$',[0.55 0.55 1 0.1]);
levelsurface(2) = videoText('$f(x) = 0.25$',[0.55 0.5 1 0.1]);
levelsurface(3) = videoText('$f(x) = 3$',[0.55 0.45 1 0.1]);
levelsurface(4) = videoText('$f(x) = 6.25$',[0.55 0.4 1 0.1]);
set(levelsurface,'Color','none');
levelsurface(5) = videoText('Level surfaces of $f(x)$:',[0.5 0.6 1 0.1]);
x = -5:0.1:5;
y = x;
z = x;
[X,Y,Z] = meshgrid(x,y,z);
V = f(X,Y,Z);
colorlist = {'r','m','b',[0.9290    0.6940    0.1250]};
for i = 1:length(levellist)
    if i>1
        delete(p)
    end
    level = levellist(i);
    p = patch(isosurface(X,Y,Z,V,level),...
       'FaceVertexCData',level,...
       'FaceColor',colorlist{i},...
       'EdgeColor','none',...
       'FaceAlpha',0.4);
   
   % regular points on surface level
    syms x1sym x2sym x3sym
    S = solve(x1sym^2+x2sym^2+1/4*x3sym^2==level, -x1sym+x3sym-1==0, x1sym^2+x2sym^2-2*x1sym==0,'Real',true);
    for j=1:length(S.x1sym)
        plot3(S.x1sym(j),S.x2sym(j),S.x3sym(j),'.','Color',colorlist{i},'MarkerSize',25);
    end
   levelsurface(i).Color = colorlist{i};
   animateNow('shortp')
   rotateCamera(ax,360,5*FR)
   animateNow('shortp')
end
animateNow('mediump')
delete(levelsurface)

% level surface at minimizer
delete(p)
patch(isosurface(X,Y,Z,V,0.25),...
   'FaceVertexCData',0.25,...
   'FaceColor',colorlist{2},...
   'EdgeColor','none',...
   'FaceAlpha',0.4);
[hamin, htmin] = videoArrow3('Minimizer',0,0,1,-1,1,1,1,'vector');
animateNow('mediump')
delete([hamin, htmin])
videoText('\underline{Finding minimizers using KKT conditions:}',[0.5 0.61 1 0.1]);

animateNow('mediump')

% preparing data for calculating gradients and planes along constraint
xmin = [0 0 1];
xaa = xmin(1);
yaa = xmin(2);
zaa = xmin(3);
xab = cos(linspace(pi+pi/(8*FR),2*pi,8*FR))+1;
yab = sin(linspace(pi+pi/(8*FR),2*pi,8*FR));
zab = xab+1;
xa = [xaa xab];
ya = [yaa yab];
za = [zaa zab];

% first-time showing of gradients and planes
x = -6:0.2:6;
y = x;
z = x;
[X,Y,Z] = meshgrid(x,y,z);
i=1;
    % gradients and Jacobian
    Jp = J(xa(i),ya(i),za(i));
    gap1 = Jp(:,1);
    gap2 = Jp(:,2);
    gfp = gf(xa(i),ya(i),za(i));
    gradients(1).Color = 'k';
    animateNow('mediump')
    p = plot3(xa(i),ya(i),za(i),'r.','markersize',10);
    [gfa, gft] = videoArrow3('$\nabla f(\bar{x})$',xa(i),ya(i),za(i),gfp(1),gfp(2),gfp(3),norm(gfp),'gradient','b');    
    animateNow('mediump')
    gradients(2).Color = 'k';
    animateNow('mediump')
    [gaa1, gat1] = videoArrow3('$\nabla a_1(\bar{x})$',xa(i),ya(i),za(i),gap1(1),gap1(2),gap1(3),norm(gap1),'gradient','g');
    animateNow('shortp')
    [gaa2, gat2] = videoArrow3('$\nabla a_2(\bar{x})$',xa(i),ya(i),za(i),gap2(1),gap2(2),gap2(3),norm(gap2),'gradient','g');
    animateNow('mediump')
    rotateCamera(ax,360,8*FR)       
    
    % tangent plane of f
    delete(gradients)
    Tpdef(1).Color = 'k';
    animateNow('mediump')
    Tpdef(2).Color = 'k';
    Tpleg(1).FaceColor = 'b';
    animateNow('mediump')
    V = gfp(1)/norm(gfp)*(X-xa(i))+gfp(2)/norm(gfp)*(Y-ya(i))+gfp(3)/norm(gfp)*(Z-za(i));
    level = 0;
    Txf = patch(isosurface(X,Y,Z,V,level),...
       'FaceVertexCData',level,...
       'FaceColor','b',...
       'EdgeColor','none',...
       'FaceAlpha',0.4);
   animateNow('shortp')
   rotateCamera(ax,360,8*FR,-40)     
   
   % tangent plane of A
   Tpdef(3).Color = 'k';
   Tpleg(2).FaceColor = 'r';
   animateNow('mediump')
   nv = cross(gap1,gap2);
   nv = nv/norm(nv);
   TxA = plot3(x*nv(1)+xa(i),y*nv(2)+ya(i),z*nv(3)+za(i),'r','linewidth',2);
   animateNow('shortp')
   rotateCamera(ax,360,8*FR,-40)     
   
   % normal plane of f
   Npdef(1).Color = 'k';
   animateNow('mediump')
   Npdef(2).Color = 'k';
   Npleg(1).FaceColor = 'b';
   animateNow('mediump')
   xNf = x-1;
   yNf = xNf;
   zNf = xNf;
   Nxf = plot3(xNf*gfp(1)/norm(gfp)+xa(i),yNf*gfp(2)/norm(gfp)+ya(i),zNf*gfp(3)/norm(gfp)+za(i),'b','linewidth',2);
   animateNow('mediump')
   
    
   % normal plane of A
   Npdef(3).Color = 'k';
   Npleg(2).FaceColor = 'r';
   animateNow('mediump')
   VnA = nv(1)*(X-xa(i))+nv(2)*(Y-ya(i))+nv(3)*(Z-za(i)); % equation of a plane
   level = 0;
   NxA = patch(isosurface(X,Y,Z,VnA,level),...
       'FaceVertexCData',level,...
       'FaceColor','r',...
       'EdgeColor','none',...
       'FaceAlpha',0.4);
   animateNow('shortp')
   rotateCamera(ax,360,8*FR,-50);
   animateNow('mediump')  
   
   delete([Tpdef Npdef Tpleg Npleg])
   set(notethat(1:4),'Color','k')
   Nplegthrm(1).FaceColor = 'b';
   Nplegthrm(2).FaceColor = 'r';
   animateNow('longp')
   set(notethat(5:6),'Color','k')
   animateNow('mediump')

% moving gradients and planes along the constraints
for i=2:length(xa)
    delete([gaa1 gat1 gaa2 gat2 gfa gft p Txf TxA NxA Nxf])

    % gradients and Jacobian
    Jp = J(xa(i),ya(i),za(i));
    gap1 = Jp(:,1);
    gap2 = Jp(:,2);
    gfp = gf(xa(i),ya(i),za(i));
    p = plot3(xa(i),ya(i),za(i),'r.','markersize',10);
    [gaa1, gat1] = videoArrow3('$\nabla a_1(\bar{x})$',xa(i),ya(i),za(i),gap1(1),gap1(2),gap1(3),norm(gap1),'gradient','g');
    [gaa2, gat2] = videoArrow3('$\nabla a_2(\bar{x})$',xa(i),ya(i),za(i),gap2(1),gap2(2),gap2(3),norm(gap2),'gradient','g');
    [gfa, gft] = videoArrow3('$\nabla f(\bar{x})$',xa(i),ya(i),za(i),gfp(1),gfp(2),gfp(3),norm(gfp),'gradient','b');           
    
    % tangent plane of f
    V = gfp(1)/norm(gfp)*(X-xa(i))+gfp(2)/norm(gfp)*(Y-ya(i))+gfp(3)/norm(gfp)*(Z-za(i));
    level = 0;
    Txf = patch(isosurface(X,Y,Z,V,level),...
       'FaceVertexCData',level,...
       'FaceColor','b',...
       'EdgeColor','none',...
       'FaceAlpha',0.4);
   
    % tangent plane of A
   nv = cross(gap1,gap2);
   nv = nv/norm(nv);
   TxA = plot3(x*nv(1)+xa(i),y*nv(2)+ya(i),z*nv(3)+za(i),'r','linewidth',2);
   
   % normal plane of f
   xNf = x-norm([xa(i);ya(i);za(i)])/2;
   yNf = xNf;
   zNf = xNf;
   Nxf = plot3(xNf*gfp(1)/norm(gfp)+xa(i),yNf*gfp(2)/norm(gfp)+ya(i),zNf*gfp(3)/norm(gfp)+za(i),'b','linewidth',2);

   % normal plane of A
   VnA = nv(1)*(X-xa(i))+nv(2)*(Y-ya(i))+nv(3)*(Z-za(i)); % equation of a plane
   level = 0;
   NxA = patch(isosurface(X,Y,Z,VnA,level),...
       'FaceVertexCData',level,...
       'FaceColor','r',...
       'EdgeColor','none',...
       'FaceAlpha',0.4);
    animateNow(1)
end

animateNow('mediump')
rotateCamera(ax,360,8*FR,20)
videoText('Note how this point also fulfills KKT,',[0.55 0.15 1 0.1]);
videoText('but is a maximizer.',[0.55 0.1 1 0.1]);
animateNow('endp')
end
