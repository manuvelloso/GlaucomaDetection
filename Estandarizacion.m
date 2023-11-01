%% Estandarización de Imágenes
% Input: imagen (im)
% Output: imagen (I) redimensionada

function I = Estandarizacion(im)
I = Recorte(im);
I = imresize(I,[225 225]);
end