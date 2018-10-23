function [G2Matrix] = Gauss2(sig)
  N = floor(3.7*sig-0.5);
  MaskSize = 2*N+1;
  Mask = [];
  startPoint = -1*floor(MaskSize/2);
  endPoint = MaskSize/2;
  sum =0;
   x = startPoint;
   y = endPoint;
  for i=1 :MaskSize
    x = startPoint;
    for j=1 :MaskSize
      Mask(i,j) = ((1/(2*pi*realpow(sig,2)))*exp(-(realpow(x,2)+realpow(y,2))/(2*realpow(sig,2))));
      x = x+1;
    endfor
    y = y-1;
  endfor
  G2Matrix = Mask;
endfunction
