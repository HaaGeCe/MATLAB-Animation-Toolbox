%% Videos for the 6th-semester course "Matrix Computations and Convex
% Optimization", offered at Aalborg University, Denmark.
%
% by Henrik Glavind Clausen, Aalborg University.
% Last modified: 27 August, 2019.
% Email: hclaus15@student.aau.dk (until 2020), otherwise
% henrikglavindc@gmail.com
%
% The code has been tested on MATLAB R2016b.
% This file is self-contained and may be run without any external
% functions, that is, all the external functions are defined (copy-pasted)
% in the bottom of this file. 
% The external functions (not) needed are:
%   From AAU students & staff:
%       optExampleModified.m
%       PNBexample.m
%       goldenSectionLS.m
%
%   From MathWorks file exchange:
%       arrow3d.m
%       nonLinspace.m
%
% Remember to delete them from this file if you
% want the changes from the .m-files to take effect.
%
%
% This script is able to render the following 6 videos:
%   - mm6_minimizers.mp4: Covers the basic terminology regarding optimization
%   through a few examples.
%
%   - mm6_first_order_conditions.mp4: Visualizes the first-order necessary
%   conditions for a minimizer through two small examples.
%
%   - mm7_steepest_descent.mp4: Visualizes the steepest descent algorithm.
%
%   - mm8_lagrange_multipliers.mp4: Visualises the concept of Lagrange
%   multipliers by looking at the contour spheres of a 4-dimensional
%   problem.
%
%   - mm9_central_path.mp4: Visualizes a simple exaxmple of a central path.
%
%   - mm9_primal_newton_barrier: Visualizes a smiple example of the Primal
%   Newton Barrier algorithm.
%
%
% User guide:
% If you want to render a video:
%       - Set toggleVideo = 1 below
%       - Comment in the wanted video part below
%       - Run script
%       - A dialog box will ask you to choose file name and location for
%       the video file.
%       - The video will now start rendering.
%
% If you want to render all videos at once:
%       - Run the function "renderAll" somewhere in this script (warning:
%       may take a long time to run)
%
% If you want to preview a video in MATLAB using the pause function:
%       - Set toggleVideo = 0
%       - Set togglePause = 1
%       - Comment in the wanted video part below
%       - Run script
%       - Press any key to proceed when the script pauses
%
% If you are unsatisfied with the video quality:
%       - The videos are compressed using MPEG-4. Matlab also supports
%       lossless AVI, which looks nicer, but this results in much larger
%       files. See
%       https://www.mathworks.com/help/matlab/ref/videowriter.html on how
%       to change compression method.
%
%
% Details regarding how the videos are constructed and how to edit them:
%   Each video is contained within its own function (e.g. video1_p2 or 
% steepestdescent).
%
%   The pauses in the videos are added using the function animateNow(N),
% where N is the number of frames to pause. So if you want to change the
% pacing of a video, look for all instances of animateNow and change the
% input argument accordingly. See also the help function for animateNow.
%
%   The videos use a set of functions (defined in the end of this script), of
% which some are for very specific purposes and others may see more general
% use. All function definitions contain a short description of the syntax.
%
%   The code is sparsely commented as the code is hopefully rather 
% self-explanatory. The video code usually follows a very general formular 
% like this (pseudocode):
%       text('title of video')
%           pause
%       text('problem statement')
%       generate_data_for_plotting
%       create_axis_(e.g. size of plot, axis limits, etc.)
%           pause
%       plot_data_using_animation
%           pause
%       text('some text')
%           pause
%       plot_some_more
%           pause
%           
%   In general, it should be possible to easily change small details in the
% videos such as pacing, text strings and colors. Larger changes may require
% more work and should probably be avoided.
%
%   If looking through the code, consider using code-folding as it
% may ease the reading a lot.
%
% (Note for the future: If a later version of MATLAB supports more LaTeX 
% packages, consider replacing all instances of {\rm I\!R} with \mathbb{R}.) 

close all
clear variables
clc

global toggleVideo vid FR togglePause;
toggleVideo = 1; % 1 for render, 0 for no render
togglePause = 0; % 1 for pause enabled, 0 for no pause. Alternatively use pause('on')/pause('off')
FR = 30; % Frame Rate

% open video file
if toggleVideo == 1
    [file,path] = uiputfile('.mp4','Choose a location to save the video');
    vid = VideoWriter(fullfile(path,file),'MPEG-4');
    vid.FrameRate = FR;
    vid.Quality = 100;
    open(vid);
end

% choose which video parts to render by commenting in the respective video
% part below:
video1_p1
% video1_p2
% video1_p3
% video1_p4
% video1_p42
% video1_p5
% video1_p6
% first_order_conditions
% steepestdescent
% lagrange_multipliers
% centralpath
% primalnewtonbarrier

% close video
if toggleVideo == 1
    close(vid);
end
%% %%%%%%%%%%%%%%%%%%%%% Render all videos %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function renderAll
% call this function to render all videos at once with pre-determined file
% names. Warning: Will overwrite existing files with same file name.

global toggleVideo vid FR togglePause;
toggleVideo = 1; % 1 for render, 0 for no render
togglePause = 0; % 1 for pause enabled, 0 for no pause. Alternatively use pause('on')/pause('off')
FR = 30; % Frame Rate


vid = VideoWriter('mm6_minimizers.mp4','MPEG-4');
vid.FrameRate = FR;
vid.Quality = 100;
open(vid);
    video1_p1
    video1_p2
    video1_p3
    video1_p4
    video1_p42
    video1_p5
    video1_p6
close(vid);

vid = VideoWriter('mm6_first_order_conditions.mp4','MPEG-4');
vid.FrameRate = FR;
vid.Quality = 100;
open(vid);
    first_order_conditions
close(vid);

vid = VideoWriter('mm7_steepest_descent.mp4','MPEG-4');
vid.FrameRate = FR;
vid.Quality = 100;
open(vid);
    steepestdescent
close(vid);

vid = VideoWriter('mm8_lagrange_multipliers.mp4','MPEG-4');
vid.FrameRate = FR;
vid.Quality = 100;
open(vid);
    lagrange_multipliers
close(vid);

vid = VideoWriter('mm9_central_path.mp4','MPEG-4');
vid.FrameRate = FR;
vid.Quality = 100;
open(vid);
    centralpath
close(vid);

vid = VideoWriter('mm9_primal_newton_barrier.mp4','MPEG-4');
vid.FrameRate = FR;
vid.Quality = 100;
open(vid);
    primalnewtonbarrier
close(vid);
end
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
%% %%%%%%%%%%%%%%%%%%%% Lagrange multipliers 2D (not used) %%%%%%%%%%%%%%%%
function lagrange2d
global FR
fig = figure('Position',[10 50 1280 720]);
videoTitle('Tangent and Normal Planes');
% animateNow('mediump')

videoText('$f: R\mapsto {\rm I\!R}^3; \quad (x_1,x_2)\mapsto x_3 = f(x_1,x_2) = x_1^2+x_2^2, \quad R\subseteq{\rm I\!R}^2$',[0.1 0.8 1 0.1])
% animateNow('mediump')
videoText('Graph of $f$: $G(f) = \{(x_1,x_2,x_3)\in{\rm I\!R}^3 \,|\, (x_1,x_2)\in R, x_3=f(x_1,x_2)\}$', [0.1 0.7 1 0.1])
% animateNow('shortp')
% drawLine([0.1 0.9],[0.72 0.72],0.5*FR)
% animateNow('mediump')
% h_R = videoText('$R = {\rm I\!R}^2$', [0.1 0.6 1 0.1]);


step(1)=videoText({'Tangent planes:','$T_{\bar{x}}f = \{x\in {\rm I\!R}^n \, |\, \nabla f(\bar{x})^{\rm T} (x-\bar{x})=0\}$',...
    '$T_{\bar{x}}A = \{x\in {\rm I\!R}^n \, |\, J(\bar{x}) (x-\bar{x})=0\}$'}, [0.6 0.6 1 0.1]);
step(2)=videoText({'Normal spaces:','$N_{\bar{x}}f = \{x\in {\rm I\!R}^n \, |\, x=\alpha\,\nabla f(\bar{x})+\bar{x}, \alpha\in {\rm I\!R}\}$',...
    '$N_{\bar{x}}A = {\rm range}(J(\bar{x}))+\bar{x}$'}, [0.6 0.45 1 0.1]);


f=@(x,y) (x).^2+(y).^2 + 2;
gf=@(x,y) [2*x;2*y];
A = @(x) x.^2+1;
gA = @(x,y) [2*x;-1];

x = -5:.2:5;
y = -5:.2:5;
[X,Y] = meshgrid(x,y);

Z = f(X,Y);
% X1 = X; X2=X;
% Y1 = Y; Y2=Y;
% Z1 = Z; Z2=Z;
% out1 = Y1==A(X1);
% out2 = Y1~=A(X1);
% 
% X1(out1) = nan;
% Y1(out1) = nan;
% Z1(out1) = nan;
% 
% X2(out2) = nan;
% Y2(out2) = nan;
% Z2(out2) = nan;

xc = x;
yc = xc.^2 +1;






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
xlim([-5 4.9])
ylim([-5 4.9])
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

% animateNow('mediump')
% invax = invisibleAxis(ax);
% hold on
% f3=fill3([-10 10 10 -10],[-10 -10 10 10], [0 0 0 0],[0.5 1 0.5]);
% axes(ax);
% videoArrow3('$R$',-1.5,-1.5,0,-1,-1,1,1,'vector');
% 
% animateNow('mediump')
ax.ZColor = ax.XColor;
axistip3(0.2,0.2,'z')
% animateNow('mediump')

[C,h] = contour(X,Y,Z);
set(h,'ShowText','on','TextStep',get(h,'LevelStep')*2)
hold on

colormap parula % winter
surf(X,Y,Z,'FaceColor','interp',...
   'EdgeColor','none',...
   'FaceLighting','gouraud')
camlight left
camlight left


% animateNow('shortp')
videoArrow3('$G(f)$',3.4,2.6,4.3,90,1);


plot(xc,yc,'g')

xc = -2:0.2:2;
yc = xc.^2+1;
for i=1:length(xc)
    if i>1
        delete([gaa gat gfa gft p TxA Txf NxA Nxf])   
    end
    gap = gA(xc(i),yc(i));
    gfp = gf(xc(i),yc(i));
    p = plot(xc(i),yc(i),'r.','markersize',10);
    [gaa, gat] = videoArrow3('$\nabla A(x)$',xc(i),yc(i),0,gap(1),gap(2),0,1,'gradient','g');
    [gfa, gft] = videoArrow3('$\nabla f(x)$',xc(i),yc(i),0,gfp(1),gfp(2),0,1,'gradient','b');
    
    % Tangent planes
    TxA = plot(-x*gap(2)+xc(i),y*gap(1)+yc(i),'r','linewidth',2);
    Txf = plot(-x*gfp(2)+xc(i),y*gfp(1)+yc(i),'b','linewidth',2);
   
    % Normal planes
    NxA = plot(x*gap(1)+xc(i),y*gap(2)+yc(i),'r');
    Nxf = plot(x*gfp(1)+xc(i),y*gfp(2)+yc(i),'b');
    
    animateNow

end
end
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
%% %%%%%%%%%%%%%%%%% Video 1: (Strong) Minimizers and Minima %%%%%%%%%%%%%%
function video1_p1
global FR
fig1 = figure('Position',[10 50 1280 720]);

videoTitle('(Strong) Minimizers and Minima');
animateNow('mediump')

videoText('$f: R\mapsto {\rm I\!R}; \quad x\mapsto y = f(x) = (x-2)^2+1, \quad R\subseteq{\rm I\!R}$',[0.1 0.8 1 0.1])
animateNow('mediump')
videoText('Graph of $f$: $G(f) = \{(x,y)\in{\rm I\!R}^2 \,|\, x\in R, y=f(x)\}$', [0.1 0.7 1 0.1])
animateNow('shortp')
drawLine([0.1 0.9],[0.72 0.72],0.5*FR)

animateNow('mediump')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Plot 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
videoText('$R = {\rm I\!R}$', [0.1 0.6 1 0.1])

animateNow('mediump')

x = linspace(-1,5,2*FR);
y = (x-2).^2+1;

ax1 = axes;
plot1 = animatedline(x(1),y(1),'Color','b');

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

videoArrow('$R$',-0.5,0,220,0.5)

xR = [-1 4.6];
yR = [0 0];
[XR, YR] = data2norm(xR,yR);
h = annotation('line',XR,YR,'Color','g');
xaxistip(0);
blink(h,1*FR);

ax.YAxis.Color = ax.XAxis.Color;
yaxistip(0.1);
animateNow('mediump')

animatePlot(plot1,x,y);

videoArrow('$G(f)$',3.6, 3.6,135,0.5)
animateNow('mediump')

plot(2,1,'r.','MarkerSize',10)

dashedLine([2 2],[1 0],1*FR)
videoArrow({'$\bar{x} = 2$', 'minimizer'},2,0,45,0.5)
animateNow('shortp')
dashedLine([2 0],[1 1],1*FR)
videoArrow({'$\bar{y} = f(\bar{x}) = 1$', 'minimum'},0,1,135,0.5)

animateNow('longp')

%%%%%%%%%%%%%%%%%%%%%%%% Plot 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
videoText('$R = [3, \infty]$', [0.1+0.5 0.6 1 0.1])

animateNow('mediump')


x1 = linspace(-1,3,4/6*2*FR);
y1 = (x1-2).^2+1;

x2 = linspace(3,5,2/6*2*FR);
y2 = (x2-2).^2+1;

ax2 = axes;
plot21 = animatedline(x1(1),y1(1),'Color','k','linestyle',':');


ax = gca;
ax.Box = 'off';
ax.YAxisLocation = 'origin';
ax.OuterPosition = [0.5 0.05 0.4 0.4*6.7/5.1];
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

plot(3,2,'r.','MarkerSize',10)

dashedLine([3 3],[2 0],1*FR)
videoArrow({'$\bar{x} = 3$', 'minimizer'},3,0,45,0.5)
animateNow('mediump')
dashedLine([3 0],[2 2],1*FR)
videoArrow({'$\bar{y} = f(\bar{x}) = 2$', 'minimum'},0,2,220,0.5)

animateNow('longp')
end
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
%% %%%%%%%%%%%%%%%%% Video 1.2: Global Minimizers %%%%%%%%%%%%%%%%%%%%%%%%%
function video1_p42
global FR
fig42 = figure('Position',[10 50 1280 720]);

videoTitle('Local and Global Minimizers');
videoText('$f: R\mapsto {\rm I\!R}; \quad x\mapsto y = f(x) = \frac{1}{2}\,x+\sin(x), \quad R\subseteq{\rm I\!R}$',[0.1 0.8 1 0.1])
videoText('Graph of $f$: $G(f) = \{(x,y)\in{\rm I\!R}^2 \,|\, x\in R, y=f(x)\}$', [0.1 0.7 1 0.1])
annotation('line',[0.1 0.9],[0.72 0.72])
animateNow('mediump')
videoText('$R = [5,\infty]$', [0.1 0.6 1 0.1])

animateNow('mediump')

% generate plot data
f=@(x) x/2+sin(x);
x1 = linspace(-2*pi,6,(6+2*pi)/(6*pi+2*pi)*2*FR);
x2 = linspace(6,6*pi,(6*pi-6)/(6*pi+2*pi)*2*FR);
y1 = f(x1);
y2 = f(x2);

% generate axis
ax1 = axes;
plot21 = animatedline(x1(1),y1(1),'Color','k','linestyle',':');

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

videoArrow('$R$',12,0,45,3)

xR = [6 19];
yR = [0 0];
[XR, YR] = data2norm(xR,yR);
h = annotation('line',XR,YR,'Color','g');
xaxistip(0);
blink(h,1*FR);

ax.YAxis.Color = ax.XAxis.Color;
yaxistip(0.1);
animateNow(2*FR)

plot22 = animatedline(x2(1),y2(1),'Color','b');
animatePlot(plot21,x1,y1);
animatePlot(plot22,x2,y2);


videoArrow('$G(f)$',18, f(18),120,3)
animateNow('mediump')

xmin = x2(1);
ymin = f(xmin);

plot(xmin,ymin,'r.','MarkerSize',10)

dashedLine([xmin xmin],[ymin 0],1*FR);

videoArrow({'Global minimizer'},xmin,0,315,3)

animateNow(1*FR)

dashedLine([xmin 0],[ymin ymin],1*FR);

videoArrow({'Global minimum'},0,ymin,125,3)

animateNow('mediump')

xmin = -pi/2-1/2+4*pi:2*pi:6*pi-pi/2-1/2;
ymin = f(xmin);

plot(xmin,ymin,'ro','MarkerSize',4)

for n=1:length(xmin)
    dashedLine([xmin(n) xmin(n)],[ymin(n) 0],0.5*FR);
end

videoArrow({'Local minimizers'},xmin(1),0,-45,4)
videoArrow({''},xmin(2),0,-100,3)

animateNow('shortp')

for n=1:length(xmin)
    dashedLine([xmin(n) 0],[ymin(n) ymin(n)],0.5*FR);
end

videoArrow({'Local minima'},0,ymin(1),120,4)
videoArrow({''},0,ymin(2),160,2)




animateNow('endp')
end
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


%% %%%%%%%%%%%%%%%%%%%%%% Function Definitions %%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [varargout] = videoTitle(string,dim)
% h = videoTitle(string,dim)
% Writes large centered text at dim = [left bottom width height].
if nargin == 1
    dim = [0 0.9 1 0.1];
end

h = annotation('textbox',dim,...
    'string',string,...
    'FontSize',30,...
    'FontWeight','bold',...
    'Interpreter','latex',...
    'LineStyle','none',...
    'fitboxtotext','on',...
    'horizontalalignment','center');

if nargout == 1
    varargout{1} = h;
end
end

function [varargout] = videoText(string,dim,alignment)
% h = videoText(string,dim)
% Writes medium left-aligned text at dim = [left bottom width height].
%
% h = videoText(string,dim,alignment) makes it possible to change
% alignment.
if nargin == 1
    dim = [0 0.9 1 0.1];
elseif nargin == 2
    alignment = 'left';
end

h=annotation('textbox',dim,...
    'string',string,...
    'FontSize',22,...
    'Interpreter','latex',...
    'LineStyle','none',...
    'fitboxtotext','on',...
    'horizontalalignment',alignment);

if nargout == 1
    varargout{1} = h;
end
end

function [varargout] = videoTextMedium(string,dim,alignment)
% h = videoText(string,dim)
% Writes medium left-aligned text at dim = [left bottom width height].
%
% h = videoText(string,dim,alignment) makes it possible to change
% alignment.
if nargin == 1
    dim = [0 0.9 1 0.1];
elseif nargin == 2
    alignment = 'left';
end

h=annotation('textbox',dim,...
    'string',string,...
    'FontSize',17,...
    'Interpreter','latex',...
    'LineStyle','none',...
    'fitboxtotext','on',...
    'horizontalalignment',alignment);

if nargout == 1
    varargout{1} = h;
end
end

function [varargout] = videoTextSmall(string,dim)
% h = videoText(string,dim)
% Writes small left-aligned text at dim = [left bottom width height].
h = annotation('textbox',dim,...
    'string',string,...
    'FontSize',14,...
    'Interpreter','latex',...
    'LineStyle','none',...
    'fitboxtotext','on',...
    'horizontalalignment','left');

if nargout == 1
    varargout{1} = h;
end
end


function moveAnnotation(h,pos,N)
% moveAnnotation(h,pos,N)
% Moves annotation with handle h to the new position given as
% old_position+pos, where pos = [pos_left pos_bottom]. Animation happens in
% N frames.
%
% h may be a vector containing handles of several annotations.

old_position = zeros(length(h),4);
for j=1:length(h)
    old_position(j,:) = h(j).Position;
end

pos_left = nonLinspace(0,pos(1),N,'cos');
pos_bot = nonLinspace(0,pos(2),N,'cos');
for i = 2:N
    for j=1:length(h)
        h(j).Position = old_position(j,:)+[pos_left(i) pos_bot(i) 0 0];
    end
    animateNow;
end
end


function [varargout] = videoArrow(string,x,y,theta,length)
% videoArrow(string,x,y,theta,length)
% Draws an arrow (with text given in string) pointing at coordinate (x,y) from angle theta (degrees)
% with length length. 

if nargin == 4
    length=1;
end

X = [length*cosd(theta)+x x+length/25*cosd(theta)];
Y = [length*sind(theta)+y y+length/25*sind(theta)];

[Xnorm, Ynorm] = data2norm(X,Y);

h=annotation('textarrow',...
    'X',Xnorm,...
    'Y',Ynorm,...,
    'string',string,...
    'FontSize',14,...
    'Interpreter','latex',...
    'horizontalalignment','left');

if nargout == 1
    varargout{1} = h;
end
end


function [varargout] = videoArrow3(string,x,y,z,ax,ay,az,length,method,varargin)
% videoArrow3(string,x,y,z,theta,length)
% Draws an arrow (with text given in string) pointing at coordinate (x,y,z)
% from angle theta (degrees) about the camera view axis with length length. 
%
% videoArrow3(string,x,y,z,ax,ay,az,length,method)
%   method = 'angle': Draws an arrow (with text given in string) pointing at coordinate (x,y,z)
%   from angle (ax, ay, az) about (x axis, y axis, z axis), respectively.
%
%   method = 'vector': Specify (ax,ay,az) as the vector coordinate from
%   where the arrow will start. (x,y,z) is considered the origin.
%
%   method = 'gradient': (x,y,z) is the point of the gradient, (ax,ay,az)
%   is the gradient. The arrow will be scaled to length.
%
% videoArrow3(string,x,y,z,ax,ay,az,length,method,color) specifies color either as string or RGB vector
% (default black)
%
% videoArrow3(string,x,y,z,ax,ay,az,length,method,alignment) forces text
% alignment to be 'left' or 'right'.
%
% videoArrow3(string,x,y,z,ax,ay,az,length,method,color,alignment) specifies color and forces text
% alignment to be 'left' or 'right'.
%
% [ha ht] = videoArrow3(___) returns the handle of the arrow and handle of
% the text.


rotx = @(x) [1 0 0; 0 cosd(x) -sind(x); 0 sind(x) cosd(x)];
roty = @(x) [cosd(x) 0 sind(x); 0 1 0; -sind(x) 0 cosd(x)];
rotz = @(x) [cosd(x) -sind(x) 0; sind(x) cosd(x) 0; 0 0 1];

if nargin == 6
    theta = ax;
    length = ay;
    dir_cam = get(gca,'CameraPosition')/norm(get(gca,'CameraPosition'));
    dir = rotz(theta)*dir_cam';
    method='camposition';
elseif nargin >= 9
    switch method
        case 'vector'
            dir = [ax; ay; az]/norm([ax; ay; az]);

        case 'angle'
            dir = rotx(ax)*roty(ay)*rotz(az)*[x;y;z];
            
        case 'gradient'
            
    end
end

if strcmp('gradient',method)
    dir = [ax; ay; az]/norm([ax; ay; az])*length;
    X = [x x+dir(1)];
    Y = [y y+dir(2)];
    Z = [z z+dir(3)];
else
    X = [length*dir(1)+x x+length/25*dir(1)];
    Y = [length*dir(2)+y y+length/25*dir(2)];
    Z = [length*dir(3)+z z+length/25*dir(3)];
end

if (Y(2)-Y(1)) < 0
    alignment = 'left';
else
    alignment = 'right';
end

if isempty(varargin)
	color = [0 0 0];
elseif strcmp(varargin{1},'left') || strcmp(varargin{1},'right')
    alignment = varargin{1};
    color = [0 0 0];
elseif size(varargin) == 2
    color = varargin{1};
    alignment = varargin{2};
else
    color = varargin{1};
end

ha=arrow3d(X,Y,Z,0.85,0.015,0.075,color);
if strcmp('gradient',method)
    ht=text(X(2),Y(2),Z(2),string,'Interpreter','latex',...
    'FontSize',14,...
    'HorizontalAlignment',alignment,...
    'VerticalAlignment','bottom');
else
    ht=text(X(1),Y(1),Z(1),string,'Interpreter','latex',...
    'FontSize',14,...
    'HorizontalAlignment',alignment,...
    'VerticalAlignment','bottom');
end
if nargout == 2
    varargout{1} = ha;
    varargout{2} = ht;
end
if nargout == 5
    varargout{1} = ha;
    varargout{2} = ht; 
    varargout{3} = X;
    varargout{4} = Y;
    varargout{5} = Z;
end
end


function xaxistip(offset)
% axestips(offset)
% Makes arrows on axes. Offset is moving the arrow ahead of the axis limit.

ax = gca;
[X, Y] = data2norm([ax.XLim(2) ax.XLim(2)+offset],[ax.YLim(2) ax.YLim(2)+offset]);
[X0, Y0] = data2norm(0,0);

annotation('arrow',...
    'X',[X(1) X(2)],...
    'Y',[Y0 Y0],...
    'Color',ax.XColor)
end

function yaxistip(offset)
% axestips(offset)
% Makes arrows on axes. Offset is moving the arrow ahead of the axis limit.

ax = gca;
[X, Y] = data2norm([ax.XLim(2) ax.XLim(2)+offset],[ax.YLim(2) ax.YLim(2)+offset]);
[X0, Y0] = data2norm(0,0);

annotation('arrow',...
    'X',[X0 X0],...
    'Y',[Y(1) Y(2)],...
    'Color',ax.YColor)
end

function axistip3(size,offset,axis,axisname)
% axistip3(size,offset,axis)
% Makes arrow tips and labels on axes in 3D plots. 
% Specify axis as a string ('x', 'y' or 'z').
% Size is the length of the arrow tip. Offset is the label offset.

if nargin == 3
    axisname = axis;
end

switch axis
    case 'x'
        col = get(gca,'XColor');
        lim = get(gca,'XLim');
        X = [lim(2)-size lim(2)];
        arrow3d([X(1) X(2)],[0 0],[0 0],0,0.01,size/4,col);
        text(X(2)+offset,0,0,['$' axisname '$'],'interpreter','latex')
        
    case 'y'
        col = get(gca,'YColor');
        lim = get(gca,'YLim');
        Y = [lim(2)-size lim(2)];
        arrow3d([0 0],[Y(1) Y(2)],[0 0],0,0.01,size/4,col);
        text(0,Y(2)+offset,0,['$' axisname '$'],'interpreter','latex')
        
    case 'z'
        col = get(gca,'ZColor');
        lim = get(gca,'ZLim');
        Z = [lim(2)-size lim(2)];
        arrow3d([0 0],[0 0],[Z(1) Z(2)],0,0.01,size/4,col);
        text(0,0,Z(2)+offset,['$' axisname '$'],'interpreter','latex')
        
    otherwise
        warning(['No axis with name ' axis ' was found. No axis tip drawn.']); 
end
end

function [Xnorm, Ynorm] = data2norm(x,y)
% [Xnorm, Ynorm] = data2norm(x,y)
% Converts a position given in data points units into a position given in
% normalized coordinates units.

ax = gca;
%get axes drawing area position in normalized relative to figure
% oldunits = get(ax, 'Units');
% set(ax, 'Units', 'pixels');
axpos = get(ax, 'Position');
    % axpos = plotboxpos(ax); % Use this when data aspect ratio has been
    % changed
% set(ax, 'Units', oldunits);
%get axes drawing area in data units
ax_xlim = xlim(ax);
ax_ylim = ylim(ax);
ax_norm_per_xdata = axpos(3) ./ diff(ax_xlim);
ax_norm_per_ydata = axpos(4) ./ diff(ax_ylim);
%these are figure-relative
Xnorm = (x - ax_xlim(1)) .* ax_norm_per_xdata + axpos(1);
Ynorm = (y- ax_ylim(1)) .* ax_norm_per_ydata + axpos(2);
end


function dashedLine(X,Y,N)
% dashedLine(X,Y,N)
% Animates a dashed line described by X and Y with for N frames.

h = animatedline('Color','k','LineStyle','--');
x = linspace(X(1),X(end),N);
y = linspace(Y(1),Y(end),N);
for n=1:N
    addpoints(h,x(n),y(n));
    animateNow;
end     
end

function rotateCamera(h,phi,N,z_elevation)
% rotateCamera(h,phi,N,z_elevation)
% Using axis handle h, camera is rotated about z axis by phi degrees. 
% Optional: During the rotation, the camera moves z_elevation up and down the z axis.
% Default: z_elevation = 10.
%
% Supports rotating several axes at the same time when h = [h1 h2]. 
% The rotation is then with respect to h1.

if nargin == 3
    z_elevation = 10;
end

nonlinspace = @(x1,x2,N) (x2 - x1)*(0.5*(1-cos(linspace(0, pi, N)))) + x1; % spacing according to y = 1/2(1-cos(x))
nonlinspacez1 = @(x1,x2,N) (x2 - x1)*(0.5*(1-cos(linspace(0, pi/2, N)))) + x1;
nonlinspacez2 = @(x1,x2,N) (x2 - x1)*(0.5*(1-cos(linspace(pi/2,pi, N)))) + x1;
% see e.g. https://se.mathworks.com/matlabcentral/fileexchange/64831-non-linearly-spaced-vector-generator
phi = nonlinspace(0,-phi,N);

posOld = h(1).CameraPosition;
x = posOld(1)*cosd(phi)-posOld(2)*sind(phi);
y = posOld(1)*sind(phi)+posOld(2)*cosd(phi);
z = posOld(3) + [nonlinspacez1(0,z_elevation,N/2) nonlinspacez2(z_elevation,0,N/2)];
for n=1:N
    for i=1:length(h)
        h(i).CameraPosition(1:3) = [x(n) y(n) z(n)];
    end
    animateNow;
end
end


function [varargout] = rotateArrow3(string,x,y,z,ax,ay,az,length,N,varargin)
% [ha ht] = rotateArrow3(string,X,Y,Z,ax,ay,az,length,N)
% Rotate an arrow around arrow starting point.
% X = [x0 xd], Y = [y0 yd], Z = [z0 zd] where the arrow goes from
% (x0,y0,z0) to (xd,yd,zd).
% Rotates ax degrees about x axis, ay degrees about y axis and az degrees
% about z axis.
% Rotation is performed in N frames.
% Returns handle of final arrow.
%
% [ha ht X Y Z] = rotateArrow3(string,X,Y,Z,ax,ay,az,length,N)
% Returns coordinates for rotated arrow as well.

if isempty(varargin)
    color = [0 0 0];
else
    color = varargin{1};
end

rotx = @(x) [1 0 0; 0 cosd(x) -sind(x); 0 sind(x) cosd(x)];
roty = @(x) [cosd(x) 0 sind(x); 0 1 0; -sind(x) 0 cosd(x)];
rotz = @(x) [cosd(x) -sind(x) 0; sind(x) cosd(x) 0; 0 0 1];

AX = nonLinspace(0,ax,N,'cos');
AY = nonLinspace(0,ay,N,'cos');
AZ = nonLinspace(0,az,N,'cos');
init_dir = [x(2)-x(1);y(2)-y(1);z(2)-z(1)]/norm([x(2)-x(1);y(2)-y(1);z(2)-z(1)]);
for i = 1:N
    if i>1
        delete([ha ht]);
    end
    dir = rotx(AX(i))*roty(AY(i))*rotz(AZ(i))*(init_dir*length);
    X = [x(1) dir(1)+x(1)];
    Y = [y(1) dir(2)+y(1)];
    Z = [z(1) dir(3)+z(1)];
%     if (Y(2)-Y(1)) < 0
        alignment = 'left';
%     else
%         alignment = 'right';
%     end
    ha=arrow3d(X,Y,Z,0.85,0.015,0.075,color);
    ht=text(X(2),Y(2),Z(2),string,'Interpreter','latex',...
    'FontSize',14,...
    'HorizontalAlignment',alignment,...
    'VerticalAlignment','bottom');

    animateNow(1)
end

if nargout >= 2
    varargout{1} = ha;
    varargout{2} = ht;
end
if nargout == 5
    varargout{3} = X;
    varargout{4} = Y;
    varargout{5} = Z;
end
end


function [ha ht p] = rotateArrowWithAngleUpdate(arrowString,X,Y,Z,gradient,phi_end,N,htext,strsub,textUpdate,varargin)
% [ha ht p] = rotateArrowWithAngleUpdate(arrowString,X,Y,Z,gradient,phi_end,N,htext,strsub,textUpdate)
% For illustrating feasible directions together with a gradient.
% Draws and rotates an arrow defined as X=[xstart xend], Y=[ystart yend], 
% Z=[zstart zend]. 
% The arrow is rotated phi_end degrees counter-clockwise in N frames, while
% the angle between the arrow and the gradient is drawn.
% 
% The text annotation with handle htext is updated with either the angle between
% gradient and arrow (for strsub = {'THETA'}) or the value of the dot product
% between gradient and arrow (for strsub = {'DOTPRODUCT'}). 
% The text annotation must contain the substring strsub, which will be
% replaced with the corresponding value. substr must be specified as a
% cell array.
%   Example: somestring = 'cos(THETA) > 0'
%
% For multiple text annotations, specify htext as a vector (e.g. htext = [htext1 htext2]) and substr as a
% cell array (e.g. substr = {substr1,substr2}). 
%
% If a text annotation with color 'none' is supposed to show up with color
% 'black' when theta > 90, then specify the strsub as 'NOTAMINIMIZER'.
%
% textUpdate determines how often the text is updated, such that the text
% is updated every textUpdate'th frame.
%
% [ha ht p] are handles for arrow, arrow text and angle plot.
%
% rotateArrowWithAngleUpdate(___,Name,Value) specifies NameValue pairs.
%       'length': Arrow length (default 1) 
%       'color': Arrow color specified as RGB vector or string (default black)
%       'recolor': Arrow recolor when theta>90 (default red)




color1 = [0 0 0];
lngth = 1;
color2 = 'red';

for i=1:length(varargin)
    switch varargin{i}
        case 'color'
            color1 = varargin{i+1};
        case 'length'
            lngth = varargin{i+1};
        case 'recolor'
            color2 = varargin{i+1};
    end
end

xCurve = @(phi) X(1) + (1/2).*cosd(phi);
yCurve = @(phi) Y(1) + (1/2).*sind(phi);


% cw = sign(phi_end); % clockwise or counter-clockwise rotation
d = [X(2)-X(1);Y(2)-Y(1)];
phi0 = atan2d(d(2),d(1))+360*(d(2)<0);
phi = nonLinspace(phi0,phi0+phi_end,N,'cos');
dphi = 0.1;
phi = phi -360*(phi>360);
phigrad = atan2d(gradient(2),gradient(1))+360*(gradient(2)<0);
d = [X(2)-X(1);Y(2)-Y(1)];    
theta = acosd(dot(d,gradient)/(norm(d)*norm(gradient)));
dotproduct = dot(gradient,d);
if theta > 90
    color = color2;
else
    color = color1;
end
% for j=1:length(htext)
%         string{j} = htext(j).String;
%         str = string{j};
%         kk = strfind(str,strsub{j});
%         if isempty(kk)
%             k(j) = 1;
%         else
%             k(j) = strfind(str,strsub{j})+isempty(strfind(str,strsub{j}));
%             htext(j).Color = color;
%         end
%         switch strsub{j}
%             case 'THETA' || 'DOTPRODUCT'
%                 htext(j).String = replace(str,{'THETA','DOTPRODUCT'},{num2str(round(theta)),num2str(round(dotproduct,2),'%#.2f')});
% %                 htext(j).String = replace(str,strsub{j},num2str(round(theta)));
% %                 htext(j).String = [str(1:k(j)-1) num2str(round(theta)) str(k(j)+length(strsub{j}):end)]; 
% %             case 'DOTPRODUCT'
% %                 htext(j).String = replace(str,strsub{j},num2str(round(dotproduct,2),'%#.2f'));
% %                 htext(j).String = [str(1:k(j)-1) num2str(round(dotproduct,2),'%#.2f') str(k(j)+length(strsub{j}):end)];
% 
%             case 'NOTAMINIMIZER'
%                 if theta > 90
%                     htext(j).Color = 'black';
%                 end
%         end
% end

% for j=1:length(htext)
%     string{j} = htext(j).String;
% end

for j=1:length(htext)
    string{j} = htext(j).String;
    str = string{j};
        if strcmp(strsub{j},'THETA') || strcmp(strsub{j},'DOTPRODUCT') || strcmp(strsub{j},'THETA DOTPRODUCT')
                htext(j).String = replace(str,{'THETA','DOTPRODUCT'},{num2str(round(theta)),num2str(round(dotproduct,2),'%#.2f')});
                htext(j).Color = color;
        elseif strcmp(strsub{j},'NOTAMINIMIZER')
                if theta > 90
                    htext(j).Color = color2;
                end
        end
end


for i=1:N
    if i > 1
        delete([ha ht]);
        delete(p);
    end
    if (phi(i)> phigrad || phigrad >= phi(i)+180) && phi(i) < phigrad+180
        p = plot(xCurve(phigrad:dphi:phi(i)),yCurve(phigrad:dphi:phi(i)),'k');
    elseif phigrad >= phi(i) || phi(i) >= phigrad+180
        p = plot(xCurve(phi(i):dphi:phigrad+360*(phi(i) >= phigrad+180)),yCurve(phi(i):dphi:phigrad+360*(phi(i) >= phigrad+180)),'k');
    end
    X(2) = X(1) + cosd(phi(i))*lngth;
    Y(2) = Y(1) + sind(phi(i))*lngth;
    d = [X(2)-X(1);Y(2)-Y(1)];    
    theta = acosd(dot(d,gradient)/(norm(d)*norm(gradient)));
    dotproduct = dot(gradient,d);
    if theta > 90
        color = color2;
    else
        color = color1;
    end
    if mod(i,textUpdate) == 0
%         for j=1:length(htext)
%                 str = string{j};
%                 switch strsub{j}
%                     case 'THETA'
% %                         htext(j).String = [str(1:k(j)-1) num2str(round(theta)) str(k(j)+length(strsub{j}):end)]; 
% htext(j).String = replace(str,strsub{j},num2str(round(theta)));
%                         htext(j).Color = color;
%                     case 'DOTPRODUCT'
% %                         htext(j).String = [str(1:k(j)-1) num2str(round(dotproduct,2),'%#.2f') str(k(j)+length(strsub{j}):end)]; 
% htext(j).String = replace(str,strsub{j},num2str(round(dotproduct,2),'%#.2f'));
%                         htext(j).Color = color;
%                     case 'NOTAMINIMIZER'
%                         if theta > 90
%                             htext(j).Color = 'red';
%                         end
%                 end
%         end
for j=1:length(htext)
    str = string{j};
        if strcmp(strsub{j},'THETA') || strcmp(strsub{j},'DOTPRODUCT') || strcmp(strsub{j},'THETA DOTPRODUCT')
                htext(j).String = replace(str,{'THETA','DOTPRODUCT'},{num2str(round(theta)),num2str(round(dotproduct,2),'%#.2f')});
                htext(j).Color = color;
        elseif strcmp(strsub{j},'NOTAMINIMIZER')
                if theta > 90
                    htext(j).Color = color2;
                end
        end
end
    end

    ha=arrow3d(X,Y,Z,0.85,0.015,0.075,color);
    ht=text(X(2),Y(2),Z(2),arrowString,'Interpreter','latex',...
    'FontSize',14,...
    'HorizontalAlignment','left',...
    'VerticalAlignment','bottom');
    animateNow(1)
    
end
end

function dashedLine3(X,Y,Z,N,n)
% dashedLine(X,Y,Z,N)
% Animates a dashed line in 3D described by X, Y and Z for N frames.
%
% dashedLine(X,Y,Z,N,n) animates n dashed lines simultaneously. X, Y and Z
% must be matrices with n rows.

if nargin == 5
%     h = animatedline.empty(n,0);
    x = zeros(n,N);
    y = x;
    z = x;
else
    n = 1;
end

for i=1:n
    h(i) = animatedline('Color','k','LineStyle','--');
    x(i,:) = linspace(X(i,1),X(i,end),N);
    y(i,:) = linspace(Y(i,1),Y(i,end),N);
    z(i,:) = linspace(Z(i,1),Z(i,end),N);
end

for j=1:N
    for i = 1:n
        addpoints(h(i),x(i,j),y(i,j),z(i,j));
    end
    animateNow;
end    
end

function [varargout] = drawLine(X,Y,N,n)
% drawLine(X,Y,N)
% Draws a line given X = [xstart xend] and Y = [ystart yend] for N frames.
%
% drawLine(X,Y,N,n) animates n  lines simultaneously. X and Y must be 
% matrices with n rows.

if nargin < 4
    n = 1;
end

% dir = [X(j,2);Y(j,2)]/norm([X(j,2);Y(j,2)]);
x = zeros(n,N+1);
y = zeros(n,N+1);
for j=1:n
    x(j,:) = nonLinspace(X(j,1),X(j,2),N+1,'cos');
    y(j,:) = nonLinspace(Y(j,1),Y(j,2),N+1,'cos');
end
for i=1:N
    if i > 1
        delete(h);
    end
%     for j=1:n
%             h(j) = annotation('line',[X(j,1) X(j,1)+(X(j,2)-X(j,1))*i/N], [Y(j,1) Y(j,1)+(Y(j,2)-Y(j,1))*i/N]);
%     end
    for j=1:n
            h(j) = annotation('line',[x(j,1) x(j,i+1)], [y(j,1) y(j,i+1)]);
    end
    animateNow
end

if nargout==1
    varargout{1} = h;
end
end

function animatePlot(h,x,y)
% animatePlot(h,x,y)
% Animates plot given an animatedLine handle h and data vectors x and y.

N = length(x);
for n=1:N
    addpoints(h,x(n),y(n));
    animateNow;
end
end


function animatePlot3(h,x,y,z,n)
% animatePlot3(h,x,y,z)
% Animates plot given an animatedLine handle h and data vectors x, y and z.
%
% animatePlot3(h,x,y,z,n) animates n plots simultaneously. x,y and z
% must be matrices with n rows.

if nargin == 4
    n = 1;
end

for j=1:length(x)
    for i = 1:n
        addpoints(h(i),x(i,j),y(i,j),z(i,j));
    end
    animateNow;
end    
end


function movePoint(xp,yp)
% movePoint(xp,yp)
% Moves a point along the trajectory defined by (xp,yp).
for i=1:length(xp)
    if i>1
        delete([l1 l2 point]);
    end
    l1 = plot([xp(i) xp(i)],[0 yp(i)],'k--');
    l2 = plot([xp(i) 0],[yp(i) yp(i)],'k--');
    point = plot(xp(i),yp(i),'r.','markersize',10);
    animateNow;
end
end


function varargout = movePoint3(xp,yp,zp)
% movePoint(xp,yp,zp)
% Moves a point along the trajectory defined by (xp,yp,zp).
%
% [dashedline pointz pointxy] = movePoint(xp,yp,zp) returns handles for the
% dashed line and the two red points.

for i=1:length(xp)
    if i>1
        delete([l1 pointz pointxy]);
    end
%     l1 = plot([xp(i) xp(i)],[0 yp(i)],'k--');
%     l2 = plot([xp(i) 0],[yp(i) yp(i)],'k--');
    l1 = plot3([xp(i) xp(i)],[yp(i) yp(i)], [zp(i) 0],'k--');
    pointz = plot3(xp(i),yp(i),zp(i),'r.','markersize',10);
    pointxy = plot3(xp(i),yp(i),0,'r.','markersize',10);
    animateNow;
end
if nargout == 3
    varargout{1} = l1;
    varargout{2} = pointz;
    varargout{3} = pointxy;
end

end


function blink(ax,N)
% blink(ax,t)
% Blinks an object with handle ax for N frames by increasing and
% decreasing line width. 
% Remark: Object with handle ax needs the property LineWidth.

ax_lw_old = ax.LineWidth;
for lw = [linspace(ax_lw_old,2,N/2) linspace(2,ax_lw_old,N/2)]
     ax.LineWidth = lw;
     animateNow
end
end

function animateNow(N)
% animateNow(N)
% Saves N frames of the current figure. Alternatively set N to be a
% predefined pause length: 'shortp','mediump','longp','endp'
%
% videoWriter object is given by global variable vid.
% May be toggled on (off) by setting global variable toggleVideo = 1 (0).

global toggleVideo vid togglePause FR

shortp = 1*FR;
mediump = 2*FR;
longp = 3*FR;
endp = 5*FR;

if nargin == 0
    N = 1;
end

if ischar(N)
    switch N
        case 'mediump'
            N = mediump;
        case 'shortp'
            N = shortp;
        case 'longp'
            N = longp;
        case 'endp'
            N = endp;
        otherwise
            N = 1*FR;
            warning(['No predefined pause known with name ',N,'. Pause set to 1*FR']) 
    end
end

if toggleVideo == 1
    for n=1:N
        writeVideo(vid,getframe(gcf));
    end
elseif togglePause == 1
    pause;
end
end



function ax = invisibleAxis(axold)
% ax = invisibleAxis(axold)
% Creates an identical invisble copy of axis axold. Useful when wanting to
% control layers.

ax = axes;
ax.Box = 'off';
ax.OuterPosition = axold.OuterPosition;
ax.Color = 'none';
ax.ZColor = 'none';
ax.XColor = 'none';
ax.YColor = 'none';
ax.TickLabelInterpreter = 'latex';
ax.XAxis.FirstCrossoverValue = 0;   % X crossover with Y axis
ax.XAxis.SecondCrossoverValue = 0;  % X crossover with Z axis
ax.YAxis.FirstCrossoverValue = 0;   % Y crossover with X axis
ax.YAxis.SecondCrossoverValue = 0;  % Y crossover with Z axis
ax.ZAxis.FirstCrossoverValue = 0;   % Z crossover with X axis
ax.ZAxis.SecondCrossoverValue = 0;  % Z crossover with Y axis
ax.XLim = axold.XLim;
ax.YLim = axold.YLim;
ax.ZLim = axold.ZLim;

ax.DataAspectRatioMode = axold.DataAspectRatioMode;
ax.PlotBoxAspectRatioMode = axold.PlotBoxAspectRatioMode;
ax.CameraViewAngleMode = axold.CameraViewAngleMode;
ax.View = axold.View ;
ax.CameraPosition = axold.CameraPosition;
ax.CameraTarget = axold.CameraTarget;
ax.CameraViewAngle = axold.CameraViewAngle;
ax.Visible = 'off';
end

function meshLinesPartition(X,Y,Z,numlines,Xnan,Ynan,Znan)
% meshLinesPartition(X,Y,Z,numlines)
% Makes a surface plots of meshgrid variables X,Y,Z with numlines of mesh lines.
% In the case where X,Y,Z have been partitioned with different spacing
% (e.g., x = [-2:0.2:0 0:0.01:2.5 2.5:0.2:5]), the number of mesh lines
% wanted in each partition must be specified (e.g. numlines = [8 10 10] for 8 lines in part1, 10 lines in part2, 10 lines in part3)
%
% This function only works if the mesh X,Y,Z have been generated with the
% same dimensions.
%
% meshLinesPartition(X,Y,Z,numlines,Xnan,Ynan,Znan)
% If the plot is supposed to contain NaN values, the specify X,Y,Z as the
% meshgrid without NaNs and then specify the meshgrid to be plotted with
% NaNs as Xnan,Ynan,Znan

%%Find the changes in spacing
spacing = zeros(1,length(X));
spacingChange = 0;
j=1;
for i=2:length(X)
    spacing(i) = X(1,i) - X(1,i-1);
    if i > 3
        if abs(spacing(i)-spacing(i-1))>1e-5
            if i>spacingChange(j)+2
                j = j+1;
                spacingChange(j) = i-1;
            end
        end
    end
end
spacingChange(j+1) = i;

%%Divide the lengths of the partitions by the number of lines needed in
%%each parition
if length(spacingChange) > 1
    lngth = zeros(1,length(spacingChange)-1);
    for i = 2:length(spacingChange)
        lngth(i) = spacingChange(i)-spacingChange(i-1);
    end
end
spacingNew = round(lngth(2:end)./numlines);

%%Plot the mesh lines
if nargin == 7
    X = Xnan;
    Y = Ynan;
    Z = Znan;
end
hold on
for j = 2:length(lngth)
    
    for i = 1+sum(lngth(1:j-1)):spacingNew(j-1):sum(lngth(1:j))
      surf([X(i,:);X(i,:)], [Y(i,:);Y(i,:)], [Z(i,:);Z(i,:)],...
      'FaceColor','none',...
        'LineStyle',':',...
       'FaceLighting','gouraud');
    end
    for i = 1+sum(lngth(1:j-1)):spacingNew(j-1):sum(lngth(1:j))
      surf([X(:,i),X(:,i)], [Y(:,i),Y(:,i)], [Z(:,i),Z(:,i)],...
      'FaceColor','none',...
        'LineStyle',':',...
       'FaceLighting','gouraud');
    end
end
end

function meshLinesPartitionHardcoded(X,Y,Z)
% Makes the mesh lines with greater space between them. 
% This is some ugly harcoded shit never to be looked at again.

% %%Extract X,Y and Z data from surface plot
% X=X1;
% Y=Y1;
% Z=Z1;
% %%Divide the lengths by the number of lines needed
% xlength = size(Z,2);
% ylength = size(Z,1);
% xnumlines = 30; % 30 lines
% ynumlines = 30; % 30 partitions
% xspacing = round(xlength/xnumlines);
% yspacing = round(ylength/ynumlines);
% %%Plot the mesh lines 
% % Plotting lines in the X-Z plane
% hold on
% for i = 1:yspacing:ylength
%   surf([X(i,:);X(i,:)], [Y(i,:);Y(i,:)], [Z(i,:);Z(i,:)],...
%   'FaceColor','none',...
%     'LineStyle',':',...
%    'FaceLighting','gouraud');
% end
% % Plotting lines in the Y-Z plane
% for i = 1:xspacing:xlength
%   surf([X(:,i),X(:,i)], [Y(:,i),Y(:,i)], [Z(:,i),Z(:,i)],...
%   'FaceColor','none',...
%     'LineStyle',':',...
%    'FaceLighting','gouraud');
% end



%%Extract X,Y and Z data from surface plot
x1=-2:0.2:0;
x2 = 0:0.01:2.5;
x3 = 2.5:0.2:5;

%%Divide the lengths by the number of lines needed
xlength1 = length(x1);
xlength2 = length(x2);
xlength3 = length(x3);
ylength1 = length(x1);
ylength2 = length(x2);
ylength3 = length(x3);

% total number of lines: 2.5*2*7/12.5*10=28

xnumlines1 = 8;
xnumlines2 = 10;
xnumlines3 = 10;
ynumlines1 = 8; 
ynumlines2 = 10;
ynumlines3 = 10;
xspacing1 = round(xlength1/xnumlines1);
xspacing2 = round(xlength2/xnumlines2);
xspacing3 = round(xlength3/xnumlines3);
yspacing1 = round(ylength1/ynumlines1);
yspacing2 = round(ylength2/ynumlines2);
yspacing3 = round(ylength3/ynumlines3);
%%Plot the mesh lines 
% Plotting lines in the X-Z plane
hold on
for i = 1:yspacing1:ylength1
  surf([X(i,:);X(i,:)], [Y(i,:);Y(i,:)], [Z(i,:);Z(i,:)],...
  'FaceColor','none',...
    'LineStyle',':',...
   'FaceLighting','gouraud');
end
for i = 1:xspacing1:xlength1
  surf([X(:,i),X(:,i)], [Y(:,i),Y(:,i)], [Z(:,i),Z(:,i)],...
  'FaceColor','none',...
    'LineStyle',':',...
   'FaceLighting','gouraud');
end

for i = ylength1+1:yspacing2:ylength2+ylength1
  surf([X(i,:);X(i,:)], [Y(i,:);Y(i,:)], [Z(i,:);Z(i,:)],...
  'FaceColor','none',...
    'LineStyle',':',...
   'FaceLighting','gouraud');
end
for i = xlength1+1:xspacing2:xlength2+xlength1
  surf([X(:,i),X(:,i)], [Y(:,i),Y(:,i)], [Z(:,i),Z(:,i)],...
  'FaceColor','none',...
    'LineStyle',':',...
   'FaceLighting','gouraud');
end

for i = ylength2+ylength1+1:yspacing3:ylength3+ylength2+ylength1
  surf([X(i,:);X(i,:)], [Y(i,:);Y(i,:)], [Z(i,:);Z(i,:)],...
  'FaceColor','none',...
    'LineStyle',':',...
   'FaceLighting','gouraud');
end
for i = xlength2+xlength1+1:xspacing3:xlength3+xlength2+xlength1
  surf([X(:,i),X(:,i)], [Y(:,i),Y(:,i)], [Z(:,i),Z(:,i)],...
  'FaceColor','none',...
    'LineStyle',':',...
   'FaceLighting','gouraud');
end
end

%% Functions for steepest descent and primal newton barrier
% Consider deleting them from here if you are using the versions located in
% their respective .m-files.
function varargout = PNBexample(anim,linesearch_method)
% PNBexample solves the standard-form LP problem
%
%   min f(x) = [-2 1 -3]x 
%   s.t. [1 1 1]x - 1 = 0,    x >= 0
%
% using the Primal Barrier Newton algorithm, as described in Antiniou, 
% p. 387. The example used is taken from Antoniou, p. 388.
%
% xmin = PNBexample returns the minimizer found for the problem.
%
% [xk, d, alpha, xl, tau] = PNBexample returns all intermediate values in
% the PNB algorithm.
%
% PNBexample(anim) specifies whether or not to animate the solution:
%       anim = 0:  No plotting (default)
%       anim = 1:  Plotting with fast animation
%       anim = 2:  Plotting with slow animation
%
% PNBexample(anim,linesearch_method) specifies the line search algorithm
% used. Choose between:
%           'backtracking'      (default)
%           'goldensection'     (remark: requires goldenSectionLS.m in path)
% Golden-section line search seems to be more precise and faster than 
% backtracking line search.
%
%
% by Henrik Glavind Clausen, Aalborg University.
% Last modified: August 23, 2019

if nargin==0
    anim = 0;
    GSLS = 0;
elseif nargin==1
    GSLS = 0;
elseif nargin==2
    switch linesearch_method
        case 'backtracking'
            GSLS = 0;
        case 'goldensection'
            GSLS = 1;
        otherwise
            warning(['No line search method "' varargin{1} '" was recognized. Using backtracking instead.'])
            GSLS = 0;
    end
end


% Step 1 - Problem formulation and initialization
% LP problem
c = [-2 1 -3]';
A = [1 1 1];
% b = 1; % (not used in PNB algorithm)

% PNB initilization
x0 = [1;1;1]*1/3; % strictly feasible starting point
% x0 = [0.3367 0.1662 0.4971]';
tau0 = .1;       % initial value for tau
sigma = 0.1;      % decrease of tau each iteration such that tau(l+1) = sigma*tau(l)
eps_inner = 1e-1; % convergence tolerance for innter loop
eps_outer = 1e-4; % convergence tolerance for outer loop
maxiter_inner = 50;      % maximum allowed itterations of inner loop
maxiter_outer = 50;      % maximum allowed itterations of outer loop
l = 1;

xl(:,1,1) = x0;
taul(1,1) = tau0;

% Linesearch parameters (backtracking linesearch is described by Boyd, p. 464) 
a = .5; % typically 0.01 <= a <= 0.5 (small a -> good precision)
b = 0.9; % typically 0.1 <= b <= 0.9  (large b -> good precision)

ftau = @(x,tau) c'*x - tau*sum(log(x)); % Cost with barrier function
gtau = @(x,tau) (c' -tau*sum(1./x))';   % Gradient of cost with barrier function

% tic
while l < maxiter_outer
    % Step 2 - Inner loop 
    k = 1;
    xk(:,k,l) = xl(:,l);
    while k < maxiter_inner
        % Step 3.1 - Calculate search direction (Eq. (12.38),
        % Antoniou, p. 386)
        X = diag(xk(:,k,l));
        tau = taul(l);
        lambda = (A*X^2*A')\A*(X^2*c-tau*xk(:,k));
        d(:,k,l) = xk(:,k,l) + 1/tau*X^2*(A'*lambda-c);

        % Step 3.2 - Calculate upper bound for alpha
        alpha_upper = 0.99*min((xk(:,k,l).*(d(:,k,l)<0))./(-d(:,k,l).*(d(:,k,l)<0)));

        % Step 3.3 - Line search 
        if GSLS == 0
            % Backtracking line search (Boyd, p. 464)
            t = alpha_upper; 
            g = gtau(xk(:,k,l),tau); % gradient of ftau
            while(ftau(xk(:,k,l)+t*d(:,k,l),tau) > ftau(xk(:,k,l),tau)+a*t*g'*d(:,k,l))
               t = b*t;
            end
            alph(k,l) = t;
        else
            % Golden-section line search (Antoniou, p. 94)
            ftauLS = @(alpha) ftau(xk(:,k,l)+alpha*d(:,k,l),tau);
            alph(k,l) = goldenSectionLS(ftauLS,0,alpha_upper,1e-2);
        end
   
        % Step 3.4 - Update variable
        xk(:,k+1,l) = xk(:,k,l) + alph(k,l)*d(:,k,l);

        % Step 3.5 - Check for convergence (inner loop)
        if(norm(alph(k,l)*d(:,k,l),2) < eps_inner)
           xl(:,l+1) = xk(:,k+1,l);
           break;
        else
           k = k+1;
        end
    end
    
    % stupid safety measure
    if k==maxiter_inner
        warning(['Max iterations (' num2str(maxiter_inner) ') for inner loop reached.'])
        xl(:,l+1) = xk(:,k,l);
        break;
    end
    
    % Step 4 - Check for convergence
    if(norm(xl(:,l)-xl(:,l+1),2) < eps_outer)
       break;
    else
        taul(l+1) = tau*sigma;
        if taul(l+1)<=0
            warning('Algorithm ended due to tau<=0.')
            break;
        end
        l = l+1;
    end
end
% toc
xmin = xl(:,l+1);


if nargout == 1
    varargout{1} = xmin;
end
if nargout > 1  
    varargout{1} = xk;
    varargout{2} = d;
    varargout{3} = alph;
    varargout{4} = xl;
    varargout{5} = taul;
end


%% Plotting
if anim > 0

%plotting the constraint surface
figure;
ax = axes;
ax.Box = 'off';
ax.Position = [0 0 0.8 0.8];
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
xlabel('$x_1$','interpreter','latex')
ylabel('$x_2$','interpreter','latex')
zlabel('$x_3$','interpreter','latex')
xticks(0:0.5:1)
yticks(0:0.5:1)
zticks(0:0.5:1)
hold on
% axistip3(0.05,0.05,'x','x_1')
% axistip3(0.05,0.05,'y','x_2')
% axistip3(0.05,0.05,'z','x_3')
ax.DataAspectRatioMode = 'manual';
ax.PlotBoxAspectRatioMode = 'manual';
ax.CameraViewAngleMode = 'manual';
% ax.Clipping = 'off';
view([116.5 33.2])
camlight left
camlight left
[X,Y,Z] =meshgrid(linspace(0,2,15),linspace(0,2,15),linspace(0,2,15));
V = X+Y+Z-1; % evaluate your implicit function over the N-D grid
pconstraint = patch(isosurface(X,Y,Z,V,0),...
            'FaceVertexCData',0,...
            'FaceColor','g',...
            'EdgeColor','none',...
            'FaceAlpha',0.4);


% check if arrow3d.m exists in path
% may be downloaded from here: https://mathworks.com/matlabcentral/fileexchange/28324-3d-arrow-plot
if exist('arrow3d','file') == 2
    arr = 1;
else 
    arr = 0;
end

% plotting the solution
for l=1:length(xl)-1
    plot3(xl(1,l),xl(2,l),xl(3,l),'r.','MarkerSize',12)
    pause(0.05+0.9*mod(1,anim))
    hlb = animatedline('Color','b');
    for k=1:size(xk,2)-1
        if xk(:,k,l) == [0;0;0]
            break;
        end
        p(k) = plot3(xk(1,k,l),xk(2,k,l),xk(3,k,l),'b.','MarkerSize',12);
        addpoints(hlb,xk(1,k,l),xk(2,k,l),xk(3,k,l));
        dir = d(:,k,l)/norm(d(:,k,l))*0.25;
        if arr==1
            Xa = [xk(1,k,l) xk(1,k,l)+dir(1)];
            Ya = [xk(2,k,l) xk(2,k,l)+dir(2)];
            Za = [xk(3,k,l) xk(3,k,l)+dir(3)];
            ha=arrow3d(Xa,Ya,Za,0.85,0.015/4,0.075/4,'k');
        else
            ha = quiver3(xk(1,k,l),xk(2,k,l),xk(3,k,l),dir(1),dir(2),dir(3),'k','MaxHeadSize',1,'LineWidth',1);
        end
        pause(0.05+0.5*mod(1,anim))
        delete(ha)
    end
    delete([hlb p])
end

end
end

function [xx,yy,zz,xSDHist,gHist,alphHist]=optExampleModified(gamma, anime)
%% Slightly modified version of optExample.m by M. Juelsgaard.
%
% by Henrik Glavind Clausen, Aalborg University.
% Last modified: August 9, 2019

% The purpose of this modification is to make the function return the
% solution of the steepest descent algorithm such that a plot can be
% generated outside the function. The original function description may be
% found below.
%
% Changes made:
%   - Added output arguments.
%   - Added variables gHist and alphHist for storing gradient and alpha value
%   for each iteration.
%   - Added the analytical solution to the 1-dimensional optimizaiton
%   problem, and commented out the inexact line search algorithm.
%   - Removed plotting.
%   - Minor adjustments to numerical variables such as start point.

%% Example on application of simple optimization algorithms:
% 
% by M. Juelsgaard, Aalborg University.
% Last modified: Apr. 2, 2012
% 
% Illustration of the steepest descent, and basic newton algorithm for the
% unconstrained convex problem:
%
% min. f(x1,x2) = .5*(x1^2 + gamma*x2^2),
% 
% Functon syntax:
%        optExample(gamma, anime)
%
% where:
%        gamma > 0: Condition parameter in the cost function
%        anime = 0: Final plotting performed with no delay
%        anime = 1: Final plotting performed as animation
%
% The employed algorithms are implemented as described in Chapter 5 of:
% A. Antoniou and W. Lu, Practical Optimization, Springer, 2007.
% 
% The function has optimum: x_star = (x1_star, x2_star) = (0,0).
%
% We have for f(x1,x2):
% 
% gradient: g(x) = [x1; gamma*x2]
% hessian: H(x) = [1 0; 0 gamma]
%
% The level curves of f(x1,x2) are ellipsoids, and the condition number 
% sigma, of these are:
%
% sigma = max(gamma, 1/gamma)
% 
% So for gamma = 1, the level curves are circles, but for
% 1 < gamma or 0 < gamma < 1, the level curves are stretched, such that
% the steepest descent algorithm has poor convergence.
% 
% However, as H(x) = H(x_star) for every x, the Newton algorithm described
% by Antoniou p. 130, obtaines perfect convergence.
%
% The example used here is taken from:
% S. Boyd and L. Vandenberghe, Convex Optimization, Cambridge, 2004, 
% pages 469-472

%% Initialization

% close all
% clc

%% Cost function data
% Input check
if (sum(size(gamma)) ~=2 || gamma <= 0)
    error('Invalid input: gamma must be positive scalar')
end
%Input check
if (sum(size(anime))~=2 || (anime ~= 1 && anime ~= 0))
    error('Invalid input: anime must be boolean scalar')
end
vect = -8:.1:8; % Domain for plotting
[xx, yy] = meshgrid(vect,vect); % Arrange domain
zz = 1/2*(xx.^2+gamma*yy.^2)+2; % Obtain function portrait

%% Optimization parameters
x0 = [5.5 -1]'; % Start point for optimization
eps = 1e-3; % Termination tolerance
ittSD = 0; % Iteration counter, steepest descent
ittN = 0; % Iteration counter, Newton
ittMax = 10000; % Maximum allowed number of iterations

%% Linesearch parameters
% Backtracking linesearch is described by Boyd, p. 464 
a = .5;
b = .9;
f = @(x)1/2*(x(1).^2+gamma*x(2).^2)+2; % Function handle

%% Steepest Descent algorthm, Antoniou p. 123
% Step 1
xSD = x0; % Starting point
xSDHist(1,:) = xSD; % Save data for plotting
converged = 0; % Convergence indicator

tic % Start timer
% Run until convergence, or for maximum nr. of. itt.
while(~converged && ittSD <= ittMax)
   ittSD = ittSD+1; % Iteration counter
    
   % Step 2 
   g = [xSD(1); gamma*xSD(2)]; % Calculate gradient
   d = -g; % Descent direction
   gHist(:,ittSD) = g;
   
   % Step 3 - Line search (Boyd, p. 464)
%    t = 1; 
%    while(f(xSD+t*d) > f(xSD)+a*t*g'*d)
%        t = b*t;
%    end
%    alph = t; % Stepsize
    
   % Step 3 - Analytical solution to 1-dimensional optimization problem
   alph = (gHist(1,ittSD)*xSDHist(ittSD,1) + gHist(2,ittSD)*xSDHist(ittSD,2)*gamma)/(gHist(1,ittSD)^2+gHist(2,ittSD)^2*gamma);
   alphHist(ittSD) = alph;
   
   % Step 4
   xSD = xSD + alph*d; % Update variable
   xSDHist(ittSD+1,:) = xSD; % Save data for plotting
   
   % Step 5
   % Check for convergence
   if(norm(alph*d,2) < eps)
       converged = 1;
   end
end
toc % Stop timer

%% Newtons algorithm, Antoniou p. 130
% Step 1
xN = x0; % Starting point
xNHist(1,:) = xN; % Save data for plotting
H = [1 0; 0 gamma]; % Hessian, independent of x, 
                    % positive definit for gamma > 0
converged = 0; % Convergence indicator

tic % Start timer
% Run until convergence, or for maximum nr. of. itt.
while(~converged && ittN <= ittMax)
   ittN = ittN+1; % Iteration counter
    
   % Step 2 
   g = [xN(1); gamma*xN(2)]; % Calculate gradient
   Hhat = H; % Hessian
   
   % Step 3
   d = -Hhat^-1*g; % Descent direction
   
   % Step 4 - Line search (Boyd, p. 464)
   t = 1;
   while(f(xN+t*d) > f(xN)+a*t*g'*d)
       t = b*t;
   end
   alph = t;

   % Step 5
   xN = xN + alph*d; % Update variable
   xNHist(ittN+1,:) = xN; % Save data for plotting
   
   % Step 6
   % Check for convergence
   if(norm(alph*d,2) < eps)
       converged = 1;
   end
end
toc % Stop timer
end

function varargout = goldenSectionLS(f,xL,xU,eps)
% [xmin, k] = goldenSectionLS(f,xL,xU,eps)
%
% Line search using the golden-section method as described by Antoniou, p.
% 94. 
%
% Inputs:
%       f:      Function handle for function to be evaluated
%       xL:     Lower bound in search interval
%       xU:     Upper bound in search interval
%       eps:    Convergence tolerance
%
% Ouputs:
%       xmin:   Minimizer
%       k:      Number of iterations used (optional)
%
%
% by Henrik Glavind Clausen, Aalborg University.
% Last modified: August 23, 2019


maxiter = 1e6; % maximum number of allowed iterations. Replace value with Inf for no limit.

% Notation (to match Antoniou): x_k = x(k), x_kp = x(k+1),  x_kp2 = x(k+2)

% Step 1
xL_k = xL;
xU_k = xU;

% Step 2
I_k = xU-xL;
K = 1.618034;
I_kp = I_k/K;
xa_k = xU_k-I_kp;
xb_k = xL_k+I_kp;
fa_k = f(xa_k);
fb_k = f(xb_k);
k = 1;

% Step 3
while k < maxiter
    if k > 1
        xa_k = xa_kp;
        xb_k = xb_kp;
        xU_k = xU_kp;
        xL_k = xL_kp;
        fa_k = fa_kp;
        fb_k = fb_kp;
        I_k = I_kp;
        I_kp = I_kp2;
    end
    I_kp2 = I_kp/K;
    
    if fa_k >= fb_k
        xL_kp = xa_k;
        xU_kp = xU_k;
        xa_kp = xb_k;
        xb_kp = xL_kp + I_kp2;
        fa_kp = fb_k;
        fb_kp = f(xb_kp);
    else
        xL_kp = xL_k;
        xU_kp = xb_k;
        xa_kp = xU_kp-I_kp2;
        xb_kp = xa_k;
        fb_kp = fa_k;
        fa_kp = f(xa_kp);
    end

    % Step 4
    if I_k < eps || xa_kp > xb_kp
        if fa_kp > fb_kp
            xmin = 1/2*(xb_kp+xU_kp);
        elseif fa_kp == fb_kp
            xmin = 1/2*(xa_kp+xb_kp);
        elseif fa_kp < fb_kp
            xmin = 1/2*(xL_kp+xa_kp);
        end
        
        if nargout >= 0
            varargout{1} =  xmin;
        end
        if nargout == 2
            varargout{2} = k;
        end
        return;
    else
        k = k+1;
    end
end

% issue a warning in case number of max iterations is reached
warning(['Number of max iterations (k = ' num2str(maxiter) ') reached, line search aborted.'])
xmin = 1/2*(xa_kp+xb_kp);
if nargout >= 0
    varargout{1} =  xmin;
end
if nargout == 2
    varargout{2} = k;
end
end

%% Third-party functions used
function [h]=arrow3d(x,y,z,head_frac,radii,radii2,colr)
%
% The function plotting 3-dimensional arrow
%
% h=arrow3d(x,y,z,head_frac,radii,radii2,colr)
%
% The inputs are:
%       x,y,z =  vectors of the starting point and the ending point of the
%           arrow, e.g.:  x=[x_start, x_end]; y=[y_start, y_end];z=[z_start,z_end];
%       head_frac = fraction of the arrow length where the head should  start
%       radii = radius of the arrow
%       radii2 = radius of the arrow head (defult = radii*2)
%       colr =   color of the arrow, can be string of the color name, or RGB vector  (default='blue')
%
% The output is the handle of the surfaceplot graphics object.
% The settings of the plot can changed using: set(h, 'PropertyName', PropertyValue)
%
% example #1:
%        arrow3d([0 0],[0 0],[0 6],.5,3,4,[1 0 .5]);
% example #2:
%        arrow3d([2 0],[5 0],[0 -6],.2,3,5,'r');
% example #3:
%        h = arrow3d([1 0],[0 1],[-2 3],.8,3);
%        set(h,'facecolor',[1 0 0])
% 
% Written by Moshe Lindner , Bar-Ilan University, Israel.
% July 2010 (C)
if nargin==5
    radii2=radii*2;
    colr='blue';
elseif nargin==6
    colr='blue';
end
if size(x,1)==2
    x=x';
    y=y';
    z=z';
end
x(3)=x(2);
x(2)=x(1)+head_frac*(x(3)-x(1));
y(3)=y(2);
y(2)=y(1)+head_frac*(y(3)-y(1));
z(3)=z(2);
z(2)=z(1)+head_frac*(z(3)-z(1));
r=[x(1:2)',y(1:2)',z(1:2)'];
N=50;
dr=diff(r);
dr(end+1,:)=dr(end,:);
origin_shift=(ones(size(r))*(1+max(abs(r(:))))+[dr(:,1) 2*dr(:,2) -dr(:,3)]);
r=r+origin_shift;
normdr=(sqrt((dr(:,1).^2)+(dr(:,2).^2)+(dr(:,3).^2)));
normdr=[normdr,normdr,normdr];
dr=dr./normdr;
Pc=r;
n1=cross(dr,Pc);
normn1=(sqrt((n1(:,1).^2)+(n1(:,2).^2)+(n1(:,3).^2)));
normn1=[normn1,normn1,normn1];
n1=n1./normn1;
P1=n1+Pc;
X1=[];Y1=[];Z1=[];
j=1;
for theta=([0:N])*2*pi./(N);
    R1=Pc+radii*cos(theta).*(P1-Pc) + radii*sin(theta).*cross(dr,(P1-Pc)) -origin_shift;
    X1(2:3,j)=R1(:,1);
    Y1(2:3,j)=R1(:,2);
    Z1(2:3,j)=R1(:,3);
    j=j+1;
end
r=[x(2:3)',y(2:3)',z(2:3)'];
dr=diff(r);
dr(end+1,:)=dr(end,:);
origin_shift=(ones(size(r))*(1+max(abs(r(:))))+[dr(:,1) 2*dr(:,2) -dr(:,3)]);
r=r+origin_shift;
normdr=(sqrt((dr(:,1).^2)+(dr(:,2).^2)+(dr(:,3).^2)));
normdr=[normdr,normdr,normdr];
dr=dr./normdr;
Pc=r;
n1=cross(dr,Pc);
normn1=(sqrt((n1(:,1).^2)+(n1(:,2).^2)+(n1(:,3).^2)));
normn1=[normn1,normn1,normn1];
n1=n1./normn1;
P1=n1+Pc;
j=1;
for theta=([0:N])*2*pi./(N);
    R1=Pc+radii2*cos(theta).*(P1-Pc) + radii2*sin(theta).*cross(dr,(P1-Pc)) -origin_shift;
    X1(4:5,j)=R1(:,1);
    Y1(4:5,j)=R1(:,2);
    Z1(4:5,j)=R1(:,3);
    j=j+1;
end
X1(1,:)=X1(1,:)*0 + x(1);
Y1(1,:)=Y1(1,:)*0 + y(1);
Z1(1,:)=Z1(1,:)*0 + z(1);
X1(5,:)=X1(5,:)*0 + x(3);
Y1(5,:)=Y1(5,:)*0 + y(3);
Z1(5,:)=Z1(5,:)*0 + z(3);
h=surf(X1,Y1,Z1,'facecolor',colr,'edgecolor','none','Clipping','off');
% camlight
% lighting phong
end

function [ nonLinVec ] = nonLinspace( mn, mx, num, spacetype )
% -------------------------------------------------------------------------
% nonLinspace(mn, mx, num, spacetype) returns a vector of non-linearly 
% spaced elements based on spacing specified by spacetype. 
%
% nonLinVec = nonLinspace(mn, mx, num, 'exp10') returns a vector of
% elements with smaller spacing at the beginning of the vector and greater
% spacing at the end of the vector based on the curve y = 10^x.
%
% nonLinVec = nonLinspace(mn, mx, num, 'cos') returns a vector of elements
% with smaller spacing at the beginning and end of the vector, and greater
% spacing in the middle based on the curve y = 1/2(1-cos(x)).
%
% nonLinVec = nonLinspace(mn, mx, num, 'log10') returns a vector of
% elements with greater spacing at the beginning of the vector and smaller
% spacing at the end of the vector. 
% 
%   Inputs: 
%       mn        - The minimum value in the vector. 
%       mx        - The maximum value in the vector.
%       num       - The number of elements in the vector. 
%       spacetype - Specifies the type of spacing needed. 
%
%   Outputs:
%       nonLinVec - A vector consisting of elements with spacing specified 
%                   by spacetype.
%
%
% Created: 10/12/17 - Connor Ott
% Last Modified: 10/23/17 - Connor Ott
% -------------------------------------------------------------------------

if strcmpi(spacetype, 'exp10')
    % exponentialliness is the upper bound of the original 10^x curve
    % before it is scaled to fit the limits requested by the user. Since
    % the concavity of 10^x changes in different parts of its domain,
    % different spacing is seen when using different bounds. After some
    % basic qualitative analysis, an exponentialliness of 20 seemed to be a
    % good fit for my purposes. Increasing this value will increase the
    % spacing towards the end of the vector and decrease it towards the
    % beginning. 
    exponentialliness = 20;
    nonLinVec = (mx-mn)/exponentialliness * ...
                (10.^(linspace(0, log10(exponentialliness+1), num)) - 1)...
                + mn;
            
elseif strcmpi(spacetype, 'cos')
    nonLinVec = (mx - mn)*(0.5*(1-cos(linspace(0, pi, num)))) + mn;
    
elseif strcmpi(spacetype, 'log10')
    % As with exponentialliness, this defines the bounds on the log10(x)
    % curve. Increasing loginess will decreasing the spacing towards the
    % end of the vector and increase it towards the beginning. 
    loginess = 1.5;
    nonLinVec = (mx - mn)/loginess* ...
                log10((linspace(0, 10^(loginess) - 1, num)+ 1)) + mn;
            
end
    
end
