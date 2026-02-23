% Estandarización de imagen
% Normaliza el tamaño y recorta la imagen al área del globo ocular
%
% Sintaxis:
%   im_new = Estandarizacion(im)
%
% Entrada:
%   im - Imagen original RGB del fondo de ojo
%
% Salida:
%   im_new - Imagen estandarizada y recortada (225x225)


function im_new = Estandarizacion(im)
    im_new = Recorte(im);
    im_new = imresize(im_new,[225 225]);
end
