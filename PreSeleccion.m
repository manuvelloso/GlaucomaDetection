%% PreSeleccion
% Input: valor numerico del nombre todas las imagenes a importar desde
% Excel (N), nombre del archivo común a todas las N (nombre)
% Output: [ ] 
% Selección de imágenes de la BD

function PreSeleccion(N,nombre)
X = size(N);
cant = 1;
for i = 1:X
    A = exist([num2str(N(i)),nombre]);
    if(A ~= 0) % chequeo que exista
        im = imread([num2str(N(i)),nombre]);
        figure(1)
        imshow(im);
        hold on
        x = input('te gusta:');
        hold off
        if(x == 1) % si tras mostrar la imagen el usuario ingresa 1 
            imwrite(im, ['NORMAL ',num2str(cant),'.jpg']); % la marco como seleccionada
            cant = cant + 1;
        end
    end
end

end