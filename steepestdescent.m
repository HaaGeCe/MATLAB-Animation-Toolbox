%% %%%%%%%%%%%%%%%%%%%%%%% Steepest Descent Video %%%%%%%%%%%%%%%%%%%%%%%%%
function steepestdescent
global FR
fig = figure('Position',[10 50 1280 720]);
videoTitle('Steepest Descent Algorithm');
animateNow('mediump')

videoText('$f: R\mapsto {\rm I\!R}^3; \quad (x_1,x_2)\mapsto x_3 = f(x_1,x_2) = \frac{1}{2}\,(x_1^2+5\,x_2^2), \quad R\subseteq{\rm I\!R}^2$',[0.1 0.8 1 0.1])
animateNow('mediump')
videoText('Graph of $f$: $G(f) = \{(x_1,x_2,x_3)\in{\rm I\!R}^3 \,|\, (x_1,x_2)\in R, x_3=f(x_1,x_2)\}$', [0.1 0.7 1 0.1])
animateNow('shortp')
drawLine([0.1 0.9],[0.72 0.72],0.5*FR)
animateNow('mediump')
h_R = videoText('$R = {\rm I\!R}^2$', [0.1 0.6 1 0.1]);

animateNow('mediump')


step(1)=videoText({'Step 1: Input $x_0$ and set $k=0$.'}, [0.6 0.6 1 0.1]);
step(2)=videoText({'Step 2: Calculate gradient $\nabla f(x_k)$ ','and set $d_k = -\nabla f(x_k)$.'}, [0.6 0.52 1 0.1]);
step(3)=videoText({'Step 3: Find $\alpha_k$, the value of $\alpha$ that ','minimizes \phantom{$f(x_k+\alpha\,d_k)$}.'}, [0.6 0.39 1 0.1]);
step(4)=videoText({'Step 4: Set $x_{k+1}=x_k+\alpha_k\,d_k$ and ','calculate $f_{k+1}=f(x_{k+1})$.'}, [0.6 0.26 1 0.1]);
step(5)=videoText({'Step 5: If $||\alpha_k\,d_k|| < \epsilon$, then ','output $\bar{x}=x_{k+1}$, otherwise ','set $k=k+1$ and repeat from Step 2.'}, [0.6 0.13 1 0.1]);
step_alpha=videoText({'\phantom{Step 3: Find $\alpha_k$, the value of $\alpha$ that }','\phantom{minimizes }$f(x_k+\alpha\,d_k)$\phantom{.}'}, [0.6 0.39 1 0.1]);
set([step step_alpha],'Color','none')

% Steepest Descent
gamma=5;
[xx,yy,zz,xSDHist,gHist,alphHist] = optExampleModified(gamma,0);
f = @(x,y) 1/2*(x.^2+gamma*y.^2)+2;
% Plotting
% Cost function surface plot

ax = axes;
ax.Box = 'off';
% ax.OuterPosition = [0.05 0.1 1 1];
ax.Position = [0 0.05 0.7 0.7];
ax.Color = 'none';
ax.ZColor = 'none';
ax.TickLabelInterpreter = 'latex';
ax.XAxis.FirstCrossoverValue = 0;   % X crossover with Y axis
ax.XAxis.SecondCrossoverValue = 0;  % X crossover with Z axis
ax.YAxis.FirstCrossoverValue = 0;   % Y crossover with X axis
ax.YAxis.SecondCrossoverValue = 0;  % Y crossover with Z axis
ax.ZAxis.FirstCrossoverValue = 0;   % Z crossover with X axis
ax.ZAxis.SecondCrossoverValue = 0;  % Z crossover with Y axis
xlim([-7.9 7.9])
ylim([-5.9 5.9])
zlim([0 10.9])
% xticks([-1 0 1 2 3 4])
yticks(-4:2:4)
% zticks([0 1 2 3 4])
ax.DataAspectRatioMode = 'manual';
ax.PlotBoxAspectRatioMode = 'manual';
ax.CameraViewAngleMode = 'manual';
% ax.CameraPosition = [33.6 130.9 70.1];
% ax.View = [147.6 25.2];
ax.CameraPosition = [33.6 120.9 90.1];
ax.View = [165.2 34.8];
ax.CameraViewAngle = 8;
ax.CLim = [0 70]; % surface and contour color limits
% ax.View = [76.4 22.8];
% ax.CameraPosition = [41.3 -6.9 19.3];
% ax.CameraTarget = [2.5 2.5 2.5];
% ax.CameraViewAngle = 6;
hold on
axistip3(0.2,0.2,'x','x_1')
axistip3(0.2,0.2,'y','x_2')
animateNow('mediump')

% invax = invisibleAxis(ax);
% hold on
% f3=fill3([-10 10 10 -10],[-10 -10 10 10], [0 0 0 0],[0.5 1 0.5]);
% axes(ax);
[ha_R ht_R] = videoArrow3('$R$',-6,2,0,-1,1/2,1,1,'vector');

animateNow('mediump')

ax.ZColor = ax.XColor;
axistip3(0.2,0.2,'z','x_3')

[C,h] = contour(xx,yy,zz);
set(h,'LevelStep',20)
set(h,'ShowText','on','TextStep',get(h,'LevelStep')*2)
hold on

colormap parula
s=surf(xx,yy,zz,'FaceColor','interp',...
   'EdgeColor','none',...
   'FaceLighting','gouraud',...
   'FaceAlpha',1);
camlight left
camlight left

animateNow('shortp')
[ha_G, ht_G] = videoArrow3('$G(f)$',-3,1.1,9.5,-1,1,-1,1,'vector');
animateNow('mediump')

col =['m' 'g'];

ittSD=length(alphHist);
istart = 1;
i_anim_end = 3;

% starting point
set(step(1),{'Color'},{'k'});
animateNow('mediump')
plot(xSDHist(istart,1),xSDHist(istart,2),'r.','MarkerSize',10)
[ha0 ht0]= videoArrow3('$x_0$',xSDHist(istart,1),xSDHist(istart,2),0,0.5,-1,1,1,'vector');
animateNow('mediump')

%tangent plane
step(1).Color = [0.5 0.5 0.5];
step(2).Color = 'k';
% set(step(2),{'Color', 'EdgeColor','LineStyle'},{'k', 'g','-'});
animateNow('mediump')
delete([ha0 ht0])
gp = gHist(:,istart)/norm(gHist(:,istart));
xp = xSDHist(istart,1);
yp = xSDHist(istart,2);
tp = plot([gp(2) -gp(2)]*10+xp, [-gp(1) gp(1)]*10+yp,'k');
[ha_tp ht_tp] = videoArrow3({'Tangent space of $x_0$', 'at the level surface'},1.8,-5,0,1,-0.5,1,1,'vector');
animateNow('mediump')

%gradient with perpendicular angle
xpp1 = xp+0.2*gp(1);
ypp1 = yp+0.2*gp(2);
tpangle = plot([0 gp(2)]*0.2+xpp1, [0 -gp(1)]*0.2+ypp1,...
    [gp(2)*0.2+xpp1 gp(2)*0.2+xp], [-gp(1)*0.2+ypp1 -gp(1)*0.2+yp],...
    'Color','k','linewidth',0.1);
[ha, ht] = videoArrow3('$\nabla f(x_0)$',xSDHist(istart,1),xSDHist(istart,2),0,gHist(1,istart),gHist(2,istart),0,1,'gradient');
animateNow('mediump')

for i= istart:10
    if i < i_anim_end
    if i>istart
        if i==istart+1
            delete([tp ha_tp ht_tp tpangle'])
        end
        delete([ha ht ha_xk ht_xk])
        step(5).Color = [0.5 0.5 0.5];
        step(2).Color = 'k';
        animateNow('mediump')
        % gradient
        [ha, ht] = videoArrow3(['$\nabla f(x_{k+' num2str(i-istart) '})$'],xSDHist(i,1),xSDHist(i,2),0,gHist(1,i),gHist(2,i),0,1,'gradient');
        animateNow('mediump')
    end

   
    % 1D problem
    step(2).Color = [0.5 0.5 0.5];
    step(3).Color = 'k';
    step_alpha.Color = col(mod(i,2)+1);
    zlimit = 10;
    polyn = [1/2*(gHist(1,i)^2+gamma*gHist(2,i)^2) -gHist(1,i)*xSDHist(i,1)-gamma*gHist(2,i)*xSDHist(i,2) 1/2*(xSDHist(i,1)^2+gamma*xSDHist(i,2)^2)-zlimit];
    polyr = roots(polyn);
    alph_zlim = polyr(polyr>0);
    if isempty(alph_zlim) || ~isreal(alph_zlim)
        alph_zlim = 1;
    end
    alpha = linspace(0,max(alph_zlim),2*FR);
    x1d = xSDHist(i,1)-gHist(1,i)*alpha;
    y1d = xSDHist(i,2)-gHist(2,i)*alpha;
    z1d = f(x1d,y1d);
    hp1 = animatedline('color',col(mod(i,2)+1)); % graph
    hp2 = animatedline('color',col(mod(i,2)+1)); % contour
    animatePlot3([hp1 hp2],[x1d;x1d],[y1d;y1d],[z1d;z1d*0],2);
    animateNow('mediump')
    
    % point trajectory
    alpha = nonLinspace(0,alphHist(i),2*FR,'cos');
    xp = xSDHist(i,1)-gHist(1,i)*alpha;
    yp = xSDHist(i,2)-gHist(2,i)*alpha;
    zp = f(xp,yp);
    [dl(i), pointz(i), pointxy(i)]=movePoint3(xp,yp,zp);
    animateNow('shortp')
    
    step(3).Color = [0.5 0.5 0.5];
    step_alpha.Color = [0.5 0.5 0.5];
    step(4).Color = 'k';
    animateNow('mediump')
    [ha_xk, ht_xk] = videoArrow3(['$x_{k+' num2str(i-istart+1) '}$'],xSDHist(i+1,1),xSDHist(i+1,2),0,90,1);
    delete(hp2)
    plot([xSDHist(i,1) xSDHist(i+1,1)],[xSDHist(i,2) xSDHist(i+1,2)],col(mod(i,2)+1))
    
    animateNow('mediump')
    step(4).Color = [0.5 0.5 0.5];
    step(5).Color = 'k';
    
    rotateCamera([ax],-110*(1-2*mod(i,2)),3*FR,100)
    animateNow('mediump')
    else
        if i == i_anim_end
            delete([ha ht ha_xk ht_xk dl])
            for j=2:5
                step(j).Color = 'k';
            end
            step_alpha.Color = 'k';
        end
        hpfast = animatedline('Color',col(mod(i,2)+1));
        xfast = linspace(xSDHist(i,1), xSDHist(i+1,1),1*FR*norm(alphHist(i)*gHist(:,i)));
        yfast = linspace(xSDHist(i,2), xSDHist(i+1,2),1*FR*norm(alphHist(i)*gHist(:,i)));
        animatePlot(hpfast,xfast,yfast);
%         plot([xSDHist(i,1) xSDHist(i+1,1)],[xSDHist(i,2) xSDHist(i+1,2)],col(mod(i,2)+1))
        plot(xSDHist(i+1,1),xSDHist(i+1,2),'r.','MarkerSize',10)
        animateNow('shortp')
        
    end
end

animateNow('endp')
end
