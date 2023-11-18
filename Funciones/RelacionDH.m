%% RelacionDH
% Input: imagen (im)
% Output: distancia entre el centro del disco hasta el promedio de las 
% columnas de los vasos (DH) relativa al radio del disco
function DH = RelacionDH(im)
% Mascara disco
[~, ~, radio] = MascaraDisco(im);

% Center es el centro del disco y Vasos es la máscara de los vasos
[center, Vasos] = CentroVasos(im);

% Erosiono con un ee vertical para deshacerme de las lineas horizontales
ee = strel('line', 2, 90);
Vasos = imerode(Vasos, ee);

% Calculo el promedio
[~, x] = find(Vasos == 1);
x_mean = floor(mean(x));

% Busco la discancia
DH = abs(center(1,1) - x_mean);
DH = DH / radio;

end