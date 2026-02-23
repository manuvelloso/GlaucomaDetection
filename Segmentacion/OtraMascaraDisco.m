% Máscara del disco óptico (método alternativo)
% Detecta el disco óptico cuando imfindcircles falla
%
% Sintaxis:
%   [D, center, radio] = OtraMascaraDisco(im)
%
% Entrada:
%   im - Imagen original RGB del fondo de ojo
%
% Salida:
%   D      - Máscara binarizada del disco óptico
%   center - Coordenadas del centro [x, y]
%   radio  - Radio del disco en píxeles
%
% Notas:
%   Método alternativo cuando la detección de círculos falla.
%   Analiza el canal rojo mediante ajuste de intensidad y
%   operaciones morfológicas (cierre y apertura) para detectar
%   el disco. Calcula radio y centro usando regionprops.


function [D, center, radio] = OtraMascaraDisco(im)
    R = im(:, :, 1);
    R = imadjust(R);

    EE = strel('disk', 3);
    R = imclose(R, EE);
    R = imopen(R, EE);
    R = imadjust(R);

    D = im2bw(R, 0.98);
    EE = strel('disk', 7);
    D = imerode(D, EE);
    D = imdilate(D, EE);

    stats = regionprops(D, 'Centroid','MajorAxisLength','MinorAxisLength');
    center = stats.Centroid;
    diametro = mean([stats.MajorAxisLength stats.MinorAxisLength], 2);
    radio = diametro/2;
end
