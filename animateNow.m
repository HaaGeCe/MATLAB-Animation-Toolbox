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
