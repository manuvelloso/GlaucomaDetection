%esta funcion se uso para hacer una seleccion de imagenes del banco de imagenes
function PreSeleccion(N)
% la entrada N tiene el valor numerico del nombre todas las imagenes
% levantado desde excel
X=size(N);
cant=1;
for i=1:X
    A = exist([num2str(N(i)),'_left.jpg']);
    if(A~=0) %chequeo que exista
        im = imread([num2str(N(i)),'_left.jpg']);
        figure(1)
        imshow(im);
        hold on
        x=input('te gusta:');
        hold off
        if(x==1) %si tras mostrar la imagen el usuario ingresa 1 
            imwrite(im, ['NORMAL ',num2str(cant),'.jpg']); % la marco como seleccionada
            cant=cant+1;
        end
    end
end

end