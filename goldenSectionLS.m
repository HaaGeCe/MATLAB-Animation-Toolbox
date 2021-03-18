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