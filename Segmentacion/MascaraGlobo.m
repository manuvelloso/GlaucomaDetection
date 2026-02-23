% Máscara del globo ocular
% Crea una máscara circular basada en el globo ocular
%
% Sintaxis:
%   D = MascaraGlobo(size, centro, radio)
%
% Entrada:
%   size   - Tamaño de la imagen [filas, columnas] o [filas, columnas, canales]
%   centro - Coordenadas del centro [x, y]
%   radio  - Radio del globo ocular en píxeles
%
% Salida:
%   D - Máscara binarizada del globo ocular


function D = MascaraGlobo(size, centro, radio)
    M = zeros(size);
    M(centro(2), centro(1)) = 1;
    D = double(bwdist(M));
    D(D<=radio) = 1;
    D(D>radio) = 0;
end
