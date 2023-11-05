function M = MascaraCircular(size, centro, radio)
M = zeros(size);                  %matriz de ceros
M(round(centro(1,2)),round(centro(1,1))) = 1;       
D = double(bwdist(M));            %calculo matriz con distancias
M(D <= radio) = 1;                  %distancia es menor al radio, la pinto
M(D > radio) = 0;
end