% Detección del globo ocular
% Encuentra el centro, radio y área del globo ocular
%
% Sintaxis:
%   [centro, radio, area] = GloboOcular(im)
%
% Entrada:
%   im - Imagen original RGB del fondo de ojo
%
% Salida:
%   centro - Coordenadas del centro [x, y]
%   radio  - Radio del globo ocular en píxeles
%   area   - Área del globo ocular
%
% Notas:
%   Convierte la imagen a escala de grises, aplica umbralización
%   de Otsu multinivel, y calcula propiedades del globo ocular
%   usando análisis de regiones (regionprops).


function [centro, radio, area] = GloboOcular(im)
    img_gray = rgb2gray(im);
    th = multithresh(img_gray, 3);

    bw = zeros(size(img_gray));
    bw(img_gray > th(1)) = 1;

    stats = regionprops(bw, 'Centroid','MajorAxisLength','MinorAxisLength');

    centro = round(stats.Centroid);
    diametro = mean([stats.MajorAxisLength stats.MinorAxisLength], 2);
    radio = diametro/2;
    area = pi*radio*radio;
end
