% Centro de vasos sanguíneos
% Calcula el centro del disco y los vasos sanguíneos filtrados
%
% Sintaxis:
%   [center, Vasos] = CentroVasos(im)
%
% Entrada:
%   im - Imagen original RGB del fondo de ojo
%
% Salida:
%   center - Coordenadas del centro del disco [x, y]
%   Vasos  - Máscara filtrada de los vasos sanguíneos cercanos al disco


function [center, Vasos] = CentroVasos(im)
    [~, ~, center] = NormalizarBlue(im, 0.1);

    % Obtener vasos para restar al disco
    Vasos = SegmentacionVasos(im);
    Vasos = bwmorph(Vasos, 'shrink');

    % Filtrar vasos que estén muy lejos del centro
    M = zeros(size(Vasos));
    M(round(center(1,2)), round(center(1,1))) = 1;
    A = double(bwdist(M));
    M(A <= 10) = 1;
    M(A > 10) = 0;
    Vasos = Vasos&M;

    % Filtro morfológico de los vasos
    eeS = strel('square', 1);
    Vasos = imerode(Vasos, eeS);
    ee = strel('square', 2);
    Vasos = imclose(Vasos, ee);
    Vasos = imdilate(Vasos, eeS);
end
