% Segmentación de vasos sanguíneos
% Detecta los vasos sanguíneos del disco óptico
%
% Sintaxis:
%   Vasos = SegmentacionVasos(im)
%
% Entrada:
%   im - Imagen original RGB del fondo de ojo
%
% Salida:
%   Vasos - Máscara binarizada de los vasos sanguíneos del disco
%
% Notas:
%   Aplica la función vesselness2D para realzar estructuras
%   tubulares. Aísla el canal verde (donde aparecen los vasos),
%   binariza el resultado, aplica operaciones morfológicas
%   (limpieza y adelgazamiento) y filtra los vasos por tamaño.


function Vasos = SegmentacionVasos(im)
    % Preprocesamiento de Imagen
    Ic = single(im);
    thr = prctile(Ic(Ic(:)>0), 1) * 0.9;
    Ic(Ic <= thr) = thr;
    Ic = Ic - min(Ic(:));
    Ic = Ic ./ max(Ic(:));

    % Función de MathWorks
    V2 = vesselness2D(Ic, 0.5:0.5:2.5, [1;1], 0.1, false);

    aux = V2;
    V2(:,:,2) = 0;
    V2(:,:,3) = 0;

    G = aux - V2;
    G(:,:,3) = 0;

    % Binarización
    th = multithresh(G, 1);
    bw_G = im2bw(G, th);

    % Operaciones morfológicas
    bw_G = bwmorph(bw_G, 'clean');
    bw_G = bwmorph(bw_G, 'thin');

    % Obtención de la máscara del disco
    [D, center, radio] = MascaraDisco(im);
    mask = MascaraCircular(size(D), center, (radio-6));

    % Vasos sanguíneos del disco
    Vasos = mask.*bw_G;
    Vasos = bwareaopen(Vasos, 8);
end
