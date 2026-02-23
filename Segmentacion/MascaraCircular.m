% Máscara circular
% Crea una máscara circular en una imagen
%
% Sintaxis:
%   M = MascaraCircular(size, centro, radio)
%
% Entrada:
%   size   - Tamaño de la imagen [filas, columnas] o [filas, columnas, canales]
%   centro - Coordenadas del centro [x, y]
%   radio  - Radio de la circunferencia en píxeles
%
% Salida:
%   M - Máscara binarizada (1 dentro del círculo, 0 afuera)


function M = MascaraCircular(size, centro, radio)
    M = zeros(size);
    M(round(centro(1,2)), round(centro(1,1))) = 1;
    D = double(bwdist(M));
    M(D <= radio) = 1;
    M(D > radio) = 0;
end
