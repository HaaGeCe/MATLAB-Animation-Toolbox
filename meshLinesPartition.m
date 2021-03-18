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
