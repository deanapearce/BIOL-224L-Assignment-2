params;
[t, A, B] = initial_conditions(width);

% initialize a movie object
% and open the file to which the movie will be written
%   note that here, we choose to export it in MPEG-4 format
% note that the size of the movie structure needs to match 
%   the number of frames that will be captured in the loop below
% framerate=5; % capture a frame at every 1/framerate value of t
M(round(stoptime/dt)) = struct('cdata',[],'colormap',[]);
v = VideoWriter('movie.mpeg4', 'MPEG-4');
open(v)

% initialize the scaled-color image
axes('Position',[0 0 1 1])
axis off
hi = image(B);
hi.CDataMapping = 'scaled';
drawnow

% display the current time within the figure
ht = text(3,width-3,'Time = 0');
ht.Color = [.95 .2 .8];
drawnow

tic % start clock
nframes = 1; % keep track of frame #

% simulate the process
% capture each frame to the movies object
while t<stoptime
    anew = A + (da*my_laplacian(A) - A.*B.^3 + f*(1-A))*dt;
    bnew = B + (db*my_laplacian(B) + A.*B.^3 - (k+f)*B)*dt;
    % changing exponent to 3 changes 1A + 3B -> 4B
    % this changes results from snake like pattern to clump around initial B locus
    A = anew;
    B = bnew;
    hi.CData = B;
    t = t+dt;
    ht.String = ['Time = ' num2str(t)];
    drawnow limitrate
    if mod(t,100)==0
       frame=getframe;
       M(nframes) = frame;
       writeVideo(v, frame);
       display(t)
    end
    nframes = nframes+1;
end

% stop the clock and print the elapsed time to the command window
delta = toc; 
disp([num2str(nframes) ' frames in ' num2str(delta) ' seconds']);

close(v)