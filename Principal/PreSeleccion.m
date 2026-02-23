% Preselección manual de imágenes
% Interfaz para seleccionar manualmente imágenes de la BD
%
% Sintaxis:
%   PreSeleccion(N, nombre)
%
% Entrada:
%   N      - Vector de números de imágenes a procesar
%   nombre - Nombre común del archivo (ej: '.jpg')
%
% Salida:
%   (ninguna - guarda archivos seleccionados con prefijo 'NORMAL')
%
% Descripción:
%   Muestra cada imagen de la BD en secuencia. El usuario
%   ingresa 1 si desea guardar la imagen o cualquier otro
%   valor para descartar. Los archivos seleccionados se
%   guardan con el nombre 'NORMAL x.jpg'.

function PreSeleccion(N,nombre)
    X = size(N);
    cant = 1;
    for i = 1:X
        A = exist([num2str(N(i)),nombre]);
        if(A ~= 0)
            im = imread([num2str(N(i)),nombre]);
            figure(1)
            imshow(im);
            hold on
            x = input('¿Te gusta?: ');
            hold off
            if(x == 1)
                imwrite(im, ['NORMAL ',num2str(cant),'.jpg']);
                cant = cant + 1;
            end
        end
    end
end
