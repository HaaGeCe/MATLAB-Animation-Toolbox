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
