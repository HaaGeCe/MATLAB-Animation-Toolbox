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
