% Relación Desplazamiento Horizontal
% Calcula el desplazamiento horizontal del centro vascular
%
% Sintaxis:
%   DH = RelacionDH(im)
%
% Entrada:
%   im - Imagen original RGB del fondo de ojo
%
% Salida:
%   DH - Desplazamiento horizontal normalizado por radio
%
% Descripción:
%   Detecta los vasos sanguíneos, erosiona verticalmente para
%   eliminar líneas horizontales, calcula el promedio de columnas
%   con vasos y obtiene la distancia respecto al centro del disco.
%   Se normaliza por el radio del disco para invariancia a escala.
%
% Notas:
%   - Valores mayores indican mayor desplazamiento del centro vascular
%   - Puede indicar asimetría asociada a glaucoma
%
% Ver también: RelacionCD, RelacionVD, CentroVasos
%
% Sistema de Detección de Glaucoma

function DH = RelacionDH(im)
    % Máscara disco
    [~, ~, radio] = MascaraDisco(im);

    % Center es el centro del disco y Vasos es la máscara de los vasos
    [center, Vasos] = CentroVasos(im);

    % Erosiono con un ee vertical para deshacerme de las lineas horizontales
    ee = strel('line', 2, 90);
    Vasos = imerode(Vasos, ee);

    % Calculo el promedio
    [~, x] = find(Vasos == 1);
    x_mean = floor(mean(x));

    % Busco la distancia
    DH = abs(center(1,1) - x_mean);
    DH = DH / radio;
end
