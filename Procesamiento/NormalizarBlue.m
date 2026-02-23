% Normalización del canal azul
% Normaliza la intensidad del canal azul y genera máscara binarizada
%
% Sintaxis:
%   [BW, D, center] = NormalizarBlue(im, A)
%
% Entrada:
%   im - Imagen original RGB del fondo de ojo
%   A  - Valor de ajuste del histograma (0 a 1), típicamente 0.1
%
% Salida:
%   BW     - Máscara binarizada del disco
%   D      - Máscara del disco en el espacio de color
%   center - Centro del disco [x, y]


function [BW, D, center] = NormalizarBlue(im, A)
    B = im(:, :, 3);

    [D, center, ~] = MascaraDisco(im);

    B_h = imadjust(B, [A 1]);
    B_h = B_h.*uint8(D);
    BW = im2bw(B_h, 0.1);
end
