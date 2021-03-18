%% %%%%%%%%%%%%%%%%%%% Primal Newton Barrier Algorithm %%%%%%%%%%%%%%%%%%%%
function primalnewtonbarrier
global FR;

fig = figure('Position',[10 50 1280 720]);
videoTitle('Primal Newton Barrier Algorithm');

% full problem statement
videoTitle('Primal Newton Barrier Algorithm');
animateNow('mediump')
problem1(1) = videoText('${\rm min}\, f(x) = c^{\rm T}\,x = [\matrix{-2 & 1 & -3}]\,x$',[0 0.80 1 0.1],'center');
animateNow('mediump')
problem1(2) = videoText('subject to',[0.18 0.75 1 0.1],'left');
animateNow('shortp')
problem1(3) = videoText('$A(x)= A\,x -b = [\matrix{1&1&1}]\,x -1 = 0,\qquad C(x) = x\geq_e 0$',[0 0.7 1 0.1],'center');
animateNow('longp')

problem2(1) = videoText({'Inequality constraints are incorporated in the cost function by adding','a locarithmic barrier function, yielding the subproblem:'},[0.1 0.55 1 0.1]);
animateNow('longp')
problem2(2) = videoText('$${\rm min}\, f_{\tau}(x) = c^{\rm T}\,x - \tau \sum_{i=1}^{n} {\rm ln}(x_i)$$',[0 0.435 1 0.1],'center');
animateNow('mediump')
problem2(3) = videoText('subject to',[0.2 0.35 1 0.1],'left');
animateNow('shortp')
problem2(4) = videoText('$A(x)= A\,x -b = 0$',[0 0.3 1 0.1],'center');
animateNow('mediump')

% short problem statement
delete(problem1)
delete(problem2(1))
moveAnnotation(problem2(2:end),[0 0.4],2*FR);
animateNow('shortp')
drawLine([0.1 0.9],[0.72 0.72],0.5*FR)
animateNow('mediump')


step(1)=videoTextMedium({'Step 1: Input strictly feasible $x_0$, choose',...
    '$\tau_0 > 0$ and set $l=0$.'}, [0.6 0.6 1 0.1]);

step(2)=videoTextMedium({'Step 2: Set $k=0$ and $x_{0}^{(l)} = x_l$.'},[0.6 0.51 1 0.1]);

step(3)=videoTextMedium({'Step 3.1: Set $d_k = x_k^{(l)}+\frac{1}{\tau_l} X^2 (A^{\rm T}\lambda-c)$ with',...
    '$\lambda=(A X^2 A^{\rm T})^{-1} A\, (X^2 c - \tau_l\, x_k^{(l)})$.'}, [0.62 0.44 1 0.1]);

step(4)=videoTextMedium({'Step 3.2: Find $\alpha_k$, the value of $\alpha$ that,',...
    'minimizes $f_ {\tau}(x_k^{(l)}+\alpha\,d_k)$ for $\alpha \in [0\,\, \hat{\alpha}_k]$',...
    'and set $x_{k+1}^{(l)}=x_k^{(l)}+\alpha_k\,d_k$.'}, [0.62 0.32 1 0.1]);

step(5)=videoTextMedium({'Step 3.3: If $||\alpha_k\,d_k|| < \epsilon_{\rm inner}$, set $x_{l+1}=x_{k+1}^{(l)}$',...
    'and go to Step 5, otherwise set $k=k+1$',...
    'and repeat from Step 3.1.'}, [0.62 0.18 1 0.1]);

step(6)=videoTextMedium({'Step 5: If $||x_l - x_{l+1}|| < \epsilon_{\rm outer}$, output $\bar{x}=x_{l+1}$,',...
    'otherwise set $l=l+1$ and $\tau_{l+1} < \tau_l$ and repeat',...
    'from Step 2.'}, [0.6 0.03 1 0.1]);

set(step,'Color','none')

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
[hac, htc, Xa, Ya, Za] = videoArrow3({'$A(x)=0$','$C(x)\geq_e 0$'},0.14,0.42,0.42,0.4,1,1,0.25,'vector');
delete(hac)
hac=arrow3d(Xa,Ya,Za,0.85,0.015/4,0.075/4,'k');
animateNow('mediump')
delete([hac, htc])
        

% plotting level surfaces of the cost function f
xx = -2:0.05:2;
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
ftau = @(x,y,z,tau) -2*x +y-3*z -tau*(log(x)+log(y)+log(z));
f = @(x,y,z) -2*x +y-3*z;
V = f(X,Y,Z);
A = [1 1 1];
c = [-2 1 -3]';
for i=1:4
    p = patch(isosurface(X,Y,Z,V,level(i)),...
                'FaceColor',colorlist{i},...
                'EdgeColor','none',...
                'FaceAlpha',0.4);
            levelsurface(i).Color = colorlist{i}; 
            
    % draw line/point where the two planes intersect        
    if i ==4
        plot3(0,0,1,'.','MarkerSize',15,'color',colorlist{i})
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
[ha, ht, Xa, Ya, Za] = videoArrow3('Minimizer',0,0,1,0.4,1,1,0.25,'vector');
delete(ha)
ha=arrow3d(Xa,Ya,Za,0.85,0.015/4,0.075/4,'k');
animateNow('mediump')
delete(levelsurface)


set(step,'Color',[0.5 0.5 0.5])

% plotting the PNB solution
[xk, d, alpha, xl, tau] = PNBexample(0,'goldensection');
klist = [3 2 1];
for l=1:3%length(xl)-1
    plot3(xl(1,l),xl(2,l),xl(3,l),'r.','MarkerSize',12)
    if l==1
        delete([ha, ht])
        step(1).Color = 'k';
        [hax0,htx0,Xa,Ya,Za] = videoArrow3('$x_0$',xl(1,l),xl(2,l),xl(3,l),-1/2,2,2,0.25,'vector');
        delete(hax0)
        hax0=arrow3d(Xa,Ya,Za,0.85,0.015/4,0.075/4,'k');
        animateNow('mediump')
        tautext = videoTextMedium(['$\tau_l =' num2str(tau(l)) '$'],[0.5 0.6 1 0.1]);
    else
        tautext.String = ['$\tau_l =' num2str(tau(l)) '$'];
    end
    animateNow('mediump')
%     for k=1:size(xk,2)-1
    for k=1:klist(l)
        if xk(:,k+1,l) == [0;0;0]
            break;
        end
        if k==1
            delete([hax0,htx0])
            step(1).Color = [0.5 0.5 0.5];
            step(6).Color = [0.5 0.5 0.5];
            step(2).Color = 'k';
            hlb = animatedline(xk(1,k,l),xk(2,k,l),xk(3,k,l),'Color','b');
            p(k) = plot3(xk(1,k,l),xk(2,k,l),xk(3,k,l),'b.','MarkerSize',12);
            animateNow('mediump')
        end
        
        step(2).Color = [0.5 0.5 0.5];
        step(5).Color = [0.5 0.5 0.5];
        step(3).Color = 'k';
        [ha,ht,Xa,Ya,Za] = videoArrow3('$d_k$',xk(1,k,l),xk(2,k,l),xk(3,k,l),d(1,k,l),d(2,k,l),d(3,k,l),0.25,'gradient');
        delete(ha)
        ha=arrow3d(Xa,Ya,Za,0.85,0.015/4,0.075/4,'k');
        animateNow('mediump')
        
        step(3).Color = [0.5 0.5 0.5];
        step(4).Color = 'k';

        xknorm = norm(xk(:,k+1,l)-xk(:,k,l));
        x1hlb = linspace(xk(1,k,l),xk(1,k+1,l),xknorm*2*FR);
        x2hlb = linspace(xk(2,k,l),xk(2,k+1,l),xknorm*2*FR);
        x3hlb = linspace(xk(3,k,l),xk(3,k+1,l),xknorm*2*FR);
        animatePlot3(hlb,x1hlb,x2hlb,x3hlb);
        p(k+1) = plot3(xk(1,k+1,l),xk(2,k+1,l),xk(3,k+1,l),'b.','MarkerSize',12);
        animateNow('mediump')
        
        step(4).Color = [0.5 0.5 0.5];
        step(5).Color = 'k';
        delete([ha ht])
        animateNow('mediump')
    end
    delete([hlb p])
    step(5).Color = [0.5 0.5 0.5];
    step(6).Color = 'k';
end
animateNow('endp')
end
