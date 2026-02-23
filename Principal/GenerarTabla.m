% !! Este es una especie de main
% Generación de tabla de características
% Extrae características de todas las imágenes de la BD
%
% Sintaxis:
%   Tabla = GenerarTabla()
%
% Entrada:
%   (ninguna - los paths están codificados)
%
% Salida:
%   Tabla - Tabla con etiquetas y 3 características: CD, DH, VD
%
% Descripción:
%   Procesa un total de 630 imágenes (307 con glaucoma, 323 normales).
%   Para cada imagen, calcula tres características diagnósticas:
%   - CD: Relación Copa-Disco
%   - DH: Desplazamiento Horizontal
%   - VD: Relación Vasos-Disco
%   Guarda los resultados en un archivo CSV seleccionado por el usuario.
%
% Notas:
%   - Etiqueta 1 = glaucoma, 0 = normal


function Tabla = GenerarTabla()
    % Add paths for function dependencies
    addpath(genpath('..\Caracteristicas'));
    addpath(genpath('..\Procesamiento'));
    addpath(genpath('..\Segmentacion'));
    addpath(genpath('..\Utilitarios'));
    
    N = 323 + 307;

    Tabla = zeros(N, 4);

    % Etiqueta
    Tabla(1:307, 1)  = 1;  % Con glaucoma
    Tabla(307 + 1:323+307, 1) = 0; % Normal

    % Cargo los datos con glaucoma
    fprintf("Cargando imagenes con glaucoma")
    for i = 1:307
        im = imread(['Images\1 (',num2str(i),').png']);
        im = Estandarizacion(im)
        fprintf("1 (",num2str(i),").png");
        Tabla(i, 2) = RelacionDH(im);
        Tabla(i, 3) = RelacionVD(im);
        Tabla(i, 4) = RelacionCD(im);
        i
    end

    fprintf("Cargando imagenes sanas")
    for j = 1:323
        im = imread(['Images\0 (',num2str(j),').png']);
        im = Estandarizacion(im)
        fprintf("0 (",num2str(i),").png");
        Tabla(j + 307, 2) = RelacionDH(im);
        Tabla(j + 307, 3) = RelacionVD(im);
        Tabla(j + 307, 4) = RelacionCD(im);
        j
    end

    T = array2table(Tabla, 'VariableNames', {'Glaucoma', 'DH', 'VG', 'CD'});
    [Nombre, direccion] = uiputfile({'*.csv','TABLA'}, 'Guardar Como');
    writetable(T,[direccion, Nombre]);
end
