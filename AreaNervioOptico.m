% INPUT: im_gray=rgb2gray(im);
% OUTPUT: AreaNervioOptico,CentroNervioOptico, RadioNervioOptico
% se usa para calcular el feature1
function [CentroNervioOptico, RadioNervioOptico, AreaGlobo]=AreaNervioOptico(im)

im_rojo=im(:,:,1);
T_rojo=multithresh(im_rojo,7); % Otsu - se ve mas el NO
bw_rojo=zeros(size(im)); 
bw_rojo(im_rojo>T_rojo(7))=1;

se=strel('disk',20);
bw_rojo=imerode(bw_rojo,se);
bw_rojo=imdilate(bw_rojo,se);
figure(1)
imshowpair(im_rojo,bw_rojo,'montage');
title('rojo')

end