%% Mascara Circular
% Input: tamaño de la imagen (size), vector con coordendas del centro del
%        círculo y radio del círculo
% Output: máscara binaria circular

function D = MascaraCircular(size, centro, radio)
M = zeros(size);                                %Matriz de ceros
M(round(centro(2)),round(centro(1))) = 1;       %1 en centro de aorta
D = double(bwdist(M));            %Cálculo matriz con distancias
D(D<=radio) = 1;                  %Distancia es menor al radio, la pinto
D(D>radio) = 0;
end