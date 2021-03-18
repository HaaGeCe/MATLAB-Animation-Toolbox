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
function [xx,yy,zz,xSDHist,gHist,alphHist]=optExampleModified(gamma, anime)
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

