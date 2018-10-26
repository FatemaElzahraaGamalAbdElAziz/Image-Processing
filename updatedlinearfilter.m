function out = linearfilter ( inp , filter , postproc )
  
  
  [imx imy] = size(inp) ;
  
  [n m] = size(filter);
  
  filter=double(filter);
 
 padx = floor((n)/2) * 2;
 pady = floor((m)/2) * 2;
 
 img = zeros(imx+padx,imy+pady);
 out = zeros(imx,imy);
 
 for i= padx/2 +1 :imx+1
    for j = pady/2+1 :imy+1
    
      img(i,j)= inp(i- padx/2 ,j-pady/2);
   
   endfor
endfor


 
 for imgi = 1: imx-padx/2
   for imgj = 1 : imy-pady/2
     
     accum =0;
     for filti = 1 :n
       for filtj = 1 :m
         
         cell = img(imgi+filti-1,imgj+filtj-1);
         newcell = cell * filter(filti,filtj);
         accum = accum + newcell;
         
         endfor
       endfor 
       
       ii=imgi;
       jj=imgj;
     if(imgi==imx-padx/2)
      ii=imgi+1;
      endif
     if(imgj==imy-pady/2)
     jj=imgj+1;
      endif
     
     out(ii,jj) = accum;
     
     endfor
   endfor

  

   
 
 if(strcmp(postproc,"cutoff"))
  
  for i= 1:imx
    for j =1:imy
      
       if(out(i,j)>255)
        out(i,j)=255;
      elseif (out(i,j)<0)
        out(i,j)=0;
      endif
      
    endfor
 endfor
 
elseif (strcmp(postproc,"abs"))
 
 for i= 1:imx
    for j =1:imy
      
       if(out(i,j)<0)
        out(i,j)=abs(out(i,j));
       endif
       
    endfor
 endfor
 
 endif 
  
  out = uint8(out);
  
  
endfunction
