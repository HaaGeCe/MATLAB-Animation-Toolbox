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
