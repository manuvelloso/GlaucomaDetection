%% Estandarización 
% Input: imágen (im)
% Output: Imagen estandarizada (im_new)
function im_new = Estandarizacion(im)
im_new = Recorte(im);
im_new = imresize(im_new,[225 225]);
end

