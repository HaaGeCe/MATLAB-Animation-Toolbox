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