%% Recorte de las imágenes ajustándolas al tamaño del globo ocular
% Input: imagen (im)
% Output: imagen (I) recortada

function I=Recorte(im)
[centro, r, ~] = GloboOcular(im);           %Obtener centro y radio

% Centro
x0 = centro(1);
y0 = centro(2);

% Tamaño
tam = floor((r+1));

[h, w, ~] = size(im);                       %Dimensiones de la imagen

% Si me mantengo dentro del rango de pixeles
if (x0 + tam) < w && (x0 - tam) > 0 && (y0 + tam) < h && (y0 - tam) > 0
    I = im(y0 - tam:y0 + tam, x0 - tam:x0 + tam, :);
else
% Sino, me quedo con la imagen que llega por parámetro
    I = im;
end

end