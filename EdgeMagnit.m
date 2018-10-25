function [Result] = EdgeMagnit(I)
  X = Sobel('H');
  firstImage = linearfilter(I , X , "absolute");
  Y = Sobel('V');
  secondImage = linearfilter(I , Y , "absolute");
  Z = firstImage + secondImage;
  
  for i = 1 : rows(Z)
    for j = 1 :columns(Z)
      
      if(Z(i,j)>255)
        Z(i,j)=255;
      elseif (Z(i,j)<0)
        Z(i,j)=0;
      endif 
      
    endfor
    endfor
  
  Result = Z;
  
endfunction
