function [CD, G_bw]=AjusteCup(G_i,G_bw,R_bw) %si entro es porque el cup quedo negro

EE = strel('disk',10);  
% Cerradura
R = imclose(G_i,EE);                 
% Aperura
R = imopen(R,EE);
R = imadjust(R,[0.8 1]); 
G_bw = im2bw(R, 0.9); 
G_bw=G_bw&R_bw;

A_disco = sum(R_bw(:));
A_copa = sum(G_bw(:));
% Relacion copa al disco    
CD = imdivide(A_copa,A_disco);

figure(2)
imshow(G_bw); % me quedo con lo que no seria cero
title('Ajuste cup')
pause(0.4)
end

