function SMask = Sobel(Mask)
  h = [-1, -2,-1;
           0,0,0;
           1, 2,1];
  v= [-1, 0,1;
        -2,0,2;
        -1, 0,1];
  if(Mask=='H')
    SMask = h;
  elseif(Mask=='V')
    SMask = v;
  endif
endfunction
