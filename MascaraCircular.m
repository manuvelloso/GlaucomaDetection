%% Mascara Circular
% Input: tama�o de la imagen (size), vector con coordendas del centro del
%        c�rculo y radio del c�rculo
% Output: m�scara binaria circular

function D = MascaraCircular(size, centro, radio)
M = zeros(size);                                %Matriz de ceros
M(round(centro(2)),round(centro(1))) = 1;       %1 en centro de aorta
D = double(bwdist(M));            %C�lculo matriz con distancias
D(D<=radio) = 1;                  %Distancia es menor al radio, la pinto
D(D>radio) = 0;
end