function M=Julia(zmin,zmax,hpx,niter,c)
  vpx=round(hpx*abs(imag(zmax-zmin)/real(zmax-zmin)));
  [zRe,zIm]=meshgrid(linspace(real(zmin),real(zmax),hpx),
                     linspace(imag(zmin),imag(zmax),vpx));
  z=zRe+i*zIm;
  cc=zeros(vpx,hpx)+c;
  M=mjcore(z,cc,niter);
end

% To use this function:
% Jc1=Julia(-1.6+1.2i,1.6-1.2i,640,64,-0.75+0.2i)
% imagesc(Jc1)