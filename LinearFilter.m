function out = LinearFilter ( inp , filter , postproc )
  
  
  [imx imy] = size(inp) ;
  
  [n m] = size(filter);
  
  filter=double(filter);
 
 padx = floor((n)/2) * 2;
 pady = floor((m)/2) * 2;
 
 img = zeros(imx+padx,imy+pady);
 out = zeros(imx,imy);
 Z = zeros(imx+padx,imy+pady);
 
 for i= (padx/2)+1:imx+(padx/2)
    for j = (pady/2)+1:imy+(pady/2)
      
      img(i,j)= inp(i-(padx/2),j-(pady/2));
   
   endfor
endfor


 
 for imgi = 1 :imx
   for imgj = 1 : imy
     
     accum =0;
     for filti = 1 :n
       for filtj = 1 :m
         
         cell = img(imgi+filti-1,imgj+filtj-1);
         newcell = cell * filter(filti,filtj);
         accum = accum + newcell;
         
         endfor
       endfor 
       
       Z(imgi+(padx/2) , imgj+(pady/2)) = accum;
  
     
     endfor
   endfor
   
   

   for i= 1 :imx
     for j=1 :imy
       out(i,j)=Z(i+(padx/2),j+(pady/2));
     endfor
   endfor
   
  

   
 
 if(strcmp(postproc,"Cutoff"))
  
  for i= 1:imx
    for j =1:imy
      
       if(out(i,j)>255)
        out(i,j)=255;
      elseif (out(i,j)<0)
        out(i,j)=0;
      endif
      
    endfor
 endfor
 
elseif (strcmp(postproc,"Absolute"))
 
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
