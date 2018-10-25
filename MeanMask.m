function [retval] = MeanMask (Width, Height)

arr=[];

for i=1:Height
  for j=1:Width

  arr(i,j)=1/(Width*Height);
endfor
endfor
retval = arr;
endfunction