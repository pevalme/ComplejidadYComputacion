function M=mandelbrot(cmin,cmax,hpx,niter)
  % This function computes the iteration:
  % z=z^2+c
  % for a set of given constants c.
  %
  % For each constant the recursion starts on z=0
  % and goes up to niter iterations to check if the solution
  % explotes or not.
  %
  % Finally the counter, which tell us if the solution goes to
  % infinite or not, is printed out.
  vpx=round(hpx*abs(imag(cmax-cmin)/real(cmax-cmin)));
  z=zeros(vpx,hpx);
  [cRe,cIm]=meshgrid(linspace(real(cmin),real(cmax),hpx),
                     linspace(imag(cmin),imag(cmax),vpx));

  c=cRe+i*cIm; % Matrix c contains all points in the plane
  M=zeros(vpx,hpx);
  for s=1:niter
    mask=abs(z)<2;
    M(mask)=M(mask)+1;
    z(mask)=z(mask).^2+c(mask);
  end
  M(mask)=0;
end

% To use this function:
% Mc=mandelbrot(-2.1+1.05i,0.7-1.05i,640,64);
% imagesc(Mc)