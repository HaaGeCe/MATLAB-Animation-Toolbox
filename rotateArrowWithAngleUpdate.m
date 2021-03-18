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
