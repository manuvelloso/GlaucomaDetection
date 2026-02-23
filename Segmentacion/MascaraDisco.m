% Máscara del disco óptico
% Detecta y segmenta el disco óptico de la imagen
%
% Sintaxis:
%   [D, center, radio] = MascaraDisco(im)
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
%   Utiliza la función vesselness2D para realzar estructuras
%   tubulares (vasos sanguíneos), aísla el canal rojo para
%   detectar el disco, y aplica imfindcircles. Si detecta círculos,
%   usa uno de ellos. Si no, utiliza el método alternativo
%   OtraMascaraDisco basado en el análisis del canal rojo.


function [D, center, radio] = MascaraDisco(im)
    Ig = rgb2gray(im);

    % Preprocesamiento de Imagen
    Ic = single(im);
    thr = prctile(Ic(Ic(:)>0), 1) * 0.9;
    Ic(Ic <= thr) = thr;
    Ic = Ic - min(Ic(:));
    Ic = Ic ./ max(Ic(:));

    % Función de MathWorks
    V2 = vesselness2D(Ic, 0.5:0.5:2.5, [1;1], 0.3, false);
    aux = V2;
    V2(:,:,1) = 0;

    R = aux - V2;
    R(:,:,2) = 0;
    R(:,:,3) = 0;

    R = rgb2gray(R);

    [center, radio] = imfindcircles(R, [15 70],'ObjectPolarity','dark','Sensitivity', 0.9);

    if ~isempty(center) && ~isempty(radio)
        radio = radio(1);
        D = MascaraCircular(size(Ig), center, radio);
    else
        [D, center, radio] = OtraMascaraDisco(im);
    end
end
