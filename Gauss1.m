function [G1Matrix] = Gauss1(size,sig)
  msk = [];
  startPoint = floor(-size/2);
  endPoint = floor(size/2);
   x = startPoint;
   y = endPoint;
  for i=1 : size
    x = startPoint;
    for j=1 : size
      msk(i,j) = (1/(2*pi*realpow(sig,2)))*exp(-(realpow(x,2)+realpow(y,2))/(2*realpow(sig,2)));
      x = x+1;
    endfor
    y = y-1;
  endfor
  G1Matrix = msk;
endfunction
