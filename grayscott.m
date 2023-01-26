% Initialize
params;
[t, A, B] = initial_conditions(width);

tic
nframes = 1;
while t<stoptime
    anew = A + (da*my_laplacian(A) - A.*B.^2 + f*(1-A))*dt;
    bnew = B + (db*my_laplacian(B) + A.*B.^2 - (k+f)*B)*dt;
    A = anew;
    B = bnew;
    t = t+dt;
    nframes = nframes+1;
end

axes('Position',[0 0 1 1])
axis off

% Add a scaled-color image
hi = image(B);
hi.CDataMapping = 'scaled';

delta = toc;
disp([num2str(nframes) ' frames in ' num2str(delta) ' seconds']);