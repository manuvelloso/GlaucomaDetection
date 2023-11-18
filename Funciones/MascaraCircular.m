%% MascaraCircular
% Input: tama�o de la imagen (size), centro y radio de la circunferencia
% Output: m�scara 
function M = MascaraCircular(size, centro, radio)
M = zeros(size);                  % matriz de ceros
M(round(centro(1,2)),round(centro(1,1))) = 1;       
D = double(bwdist(M));            % calculo matriz con distancias
M(D <= radio) = 1;                % distancia es menor al radio, la pinto
M(D > radio) = 0;
end