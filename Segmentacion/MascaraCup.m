% Máscara de la copa óptica
% Detecta y segmenta la copa óptica del disco
%
% Sintaxis:
%   C = MascaraCup(im)
%
% Entrada:
%   im - Imagen original RGB del fondo de ojo
%
% Salida:
%   C - Máscara binarizada de la copa óptica


function C = MascaraCup(im)
    C = im(:, :, 2);
    th = multithresh(C, 8);
    C = im2bw(C, double(th(7))/255);
    mask = MascaraDisco(im);
    C = mask.*C;

    figure(1)
    imshowpair(C, im)
    pause(0.6)
end
