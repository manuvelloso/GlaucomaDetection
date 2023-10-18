% INPUT: im_gray=rgb2gray(im);
% OUTPUT: CentroGlobo, RadioGlobo, AreaGlobo
% se usa para calcular el feature1
function [CentroGlobo, RadioGlobo, AreaGlobo]=Preprocesar_AreaGlobo(im_gray)

T=multithresh(im_gray,3); % Otsu
bw_fondo=zeros(size(im_gray)); %binarizacion
bw_fondo(im_gray>T(1))=1;

bw_fondo_info = regionprops('table',bw_fondo,'Centroid','MajorAxisLength','MinorAxisLength');
CentroGlobo = bw_fondo_info.Centroid;
diametro = mean([bw_fondo_info.MajorAxisLength bw_fondo_info.MinorAxisLength],2); %calculo diametro
RadioGlobo=diametro/2;

bw_fondo=zeros(size(im_gray));
bw_fondo(floor(CentroGlobo(2)), floor(CentroGlobo(1)))=1;
D=double(bwdist(bw_fondo));
bw_fondo(D<=RadioGlobo)=1;

bw_fondo_info = regionprops('table',bw_fondo,'Area');
AreaGlobo=bw_fondo_info.Area(1);

figure(2)
subplot(1,2,1)
imshow(im);
subplot(1,2,2)
imshow(bw_fondo);
hold on
viscircles(CentroGlobo,RadioGlobo)
plot(CentroGlobo(1), CentroGlobo(2),'*');
hold off
title(['Area:', num2str(AreaGlobo)]);

end