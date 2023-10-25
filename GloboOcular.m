% Inputs: imagen para binarizar
% Output: centro, radio y area del globo ocular

function [centro, radio, area] = GloboOcular(img)
% Escala de grises
N=3;
img_gray = rgb2gray(img);
th = multithresh(img_gray,N);

% Binarización
bw = zeros(size(img_gray));
bw(img_gray > th(1))=1;

stats = regionprops(bw,'Centroid','MajorAxisLength','MinorAxisLength');

% Caracteristicas
centro = round(stats.Centroid);
diametro = mean([stats.MajorAxisLength stats.MinorAxisLength],2);
radio = diametro/2;
area = pi*radio*radio;

end