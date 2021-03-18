%% Videos for the 6th-semester course "Matrix Computations and Convex
% Optimization", offered at Aalborg University, Denmark.
%
% by Henrik Glavind Clausen, Aalborg University.
% Last modified: 27 August, 2019.
% Email: hclaus15@student.aau.dk (until 2020), otherwise
% henrikglavindc@gmail.com
%
% The code has been tested on MATLAB R2016b.
% This file only contains the instructions for rendering the videos as
% well as the main routine that may be used to run it. In order to use it,
% you need all the functions needed in the MATLAB path or current folder.
%
% Otherwise, consider using the self-contained version in
% optVideosSelfcontained.m.
%
%
% This script is able to render the following 6 videos:
%   - mm6_minimizers.mp4: Covers the basic terminology regarding optimization
%   through a few examples.
%
%   - mm6_first_order_conditions.mp4: Visualizes the first-order necessary
%   conditions for a minimizer through two small examples.
%
%   - mm7_steepest_descent.mp4: Visualizes the steepest descent algorithm.
%
%   - mm8_lagrange_multipliers.mp4: Visualises the concept of Lagrange
%   multipliers by looking at the contour spheres of a 4-dimensional
%   problem.
%
%   - mm9_central_path.mp4: Visualizes a simple exaxmple of a central path.
%
%   - mm9_primal_newton_barrier: Visualizes a smiple example of the Primal
%   Newton Barrier algorithm.
%
%
% User guide:
% If you want to render a video:
%       - Set toggleVideo = 1 below
%       - Comment in the wanted video part below
%       - Run script
%       - A dialog box will ask you to choose file name and location for
%       the video file.
%       - The video will now start rendering.
%
% If you want to render all videos at once:
%       - Call the function "renderAll" (warning: may take a long time to run)
%
% If you want to preview a video in MATLAB using the pause function:
%       - Set toggleVideo = 0
%       - Set togglePause = 1
%       - Comment in the wanted video part below
%       - Run script
%       - Press any key to proceed when the script pauses
%
% If you are unsatisfied with the video quality:
%       - The videos are compressed using MPEG-4. Matlab also supports
%       lossless AVI, which looks nicer, but this results in much larger
%       files. See
%       https://www.mathworks.com/help/matlab/ref/videowriter.html on how
%       to change compression method.
%
%
% Details regarding how the videos are constructed and how to edit them:
%   Each video is contained within its own function (e.g. video1_p2 or 
% steepestdescent).
%
%   The pauses in the videos are added using the function animateNow(N),
% where N is the number of frames to pause. So if you want to change the
% pacing of a video, look for all instances of animateNow and change the
% input argument accordingly. See also the help function for animateNow.
%
%   The videos use a set of functions, of
% which some are for very specific purposes and others may see more general
% use. All function definitions contain a short description of the syntax
% which may be accessed through the "help" command.
%
%   The code is sparsely commented as the code is hopefully rather 
% self-explanatory. The video code usually follows a very general formular 
% like this (pseudocode):
%       text('title of video')
%           pause
%       text('problem statement')
%       generate_data_for_plotting
%       create_axis_(e.g. size of plot, axis limits, etc.)
%           pause
%       plot_data_using_animation
%           pause
%       text('some text')
%           pause
%       plot_some_more
%           pause
%           
%   In general, it should be possible to easily change small details in the
% videos such as pacing, text strings and colors. Larger changes may require
% more work and should probably be avoided.

close all
clear variables
clc

global toggleVideo vid FR togglePause;
toggleVideo = 1; % 1 for render, 0 for no render
togglePause = 0; % 1 for pause enabled, 0 for no pause. Alternatively use pause('on')/pause('off')
FR = 30; % Frame Rate

% open video file
if toggleVideo == 1
    [file,path] = uiputfile('.mp4','Choose a location to save the video');
    vid = VideoWriter(fullfile(path,file),'MPEG-4');
    vid.FrameRate = FR;
    vid.Quality = 100;
    open(vid);
end

% choose which video parts to render by commenting in the respective video
% part below:
video1_p1
% video1_p2
% video1_p3
% video1_p4
% video1_p42
% video1_p5
% video1_p6
% first_order_conditions
% steepestdescent
% lagrange_multipliers
% centralpath
% primalnewtonbarrier

% close video
if toggleVideo == 1
    close(vid);
end