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