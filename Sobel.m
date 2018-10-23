function Sobel(Mask)
  h = [-1, -2,-1;
           0,0,0;
           1, 2,1];
  v= [-1, 0,1;
        -2,0,2;
        -1, 0,1];
  if(Mask=='H')
    disp(h);
    #call karim's fn given h
  elseif(Mask=='V')
    disp(v);
  else
    disp(h);
    disp(v);
  endif
  Cutoff(v);
endfunction
 
function Cutoff(Image)
  for i= 1:rows(Image)
    for j=1:columns(Image)
      if(Image(i,j,:) > 255)
        Image(i,j,:)=255;
    #{  elseif(Image(i,j,:) < 0)
         Image(i,j,:)=0; #}
      endif
    endfor
  endfor
endfunction