% Detección de copa (método alternativo)
% Detecta la copa óptica usando normalización de canal azul
%
% Sintaxis:
%   C = PruebaNormalizarBlue(im)
%
% Entrada:
%   im - Imagen original RGB del fondo de ojo
%
% Salida:
%   C - Máscara binarizada de la copa óptica


function C = PruebaNormalizarBlue(im)
    % Mantener solo el disco
    D = RecorteDisco(im);

    % Canal azul
    B = D(:, :, 3);

    B = histeq(B);

    th = multithresh(B, 2);
    B(B > th(2)) = 255;
    B(B <= th(2)) = 0;

    ee = strel('disk', 3);
    B = imerode(B, ee);
    B = imdilate(B, ee);
    B = imclose(B, ee);
    B = bwmorph(B, 'clean');

    C = B;
end
