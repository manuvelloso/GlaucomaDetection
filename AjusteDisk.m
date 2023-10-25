function CD=AjusteDisk(R_i,G_bw) %si entro es porque el cup quedo negro
imshow(R_i)
EE = strel('disk',5);  
% Cerradura
R = imclose(R_i,EE);                 
% Aperura
R = imopen(R_i,EE);
R = imadjust(R,[0.8 1]); 
R_bw = im2bw(R, 0.98); 
%R_bw = imerode(R_bw,EE);

R_bw=G_bw|R_bw;

A_disco = sum(R_bw(:));
A_copa = sum(G_bw(:));
% Relacion copa al disco    
CD = imdivide(A_copa,A_disco); 

figure(2)
imshow(R_bw);
title(['Ajuste disk. CD:',num2str(CD)]);
end

