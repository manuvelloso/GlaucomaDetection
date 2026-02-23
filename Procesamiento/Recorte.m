% Recorte del globo ocular
% Recorta la imagen ajustándola al tamaño de la circunferencia del globo
%
% Sintaxis:
%   im_new = Recorte(im)
%
% Entrada:
%   im - Imagen original RGB del fondo de ojo
%
% Salida:
%   im_new - Imagen recortada centrada en el globo ocular


function im_new = Recorte(im)
    [centro, r, ~] = GloboOcular(im);
    x0 = centro(1);
    y0 = centro(2);
    tam = floor((r+1));

    [h, w, ~] = size(im);

    if (x0 + tam) < w && (x0 - tam) > 0 && (y0 + tam) < h && (y0 - tam) > 0
        im_new = im(y0 - tam:y0 + tam, x0 - tam:x0 + tam, :);
    else
        im_new = im;
    end
end
