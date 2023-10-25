function D = MascaraGlobo(size, centro, radio)
M = zeros(size);                  %matriz de ceros
M(centro(2),centro(1)) = 1;       %1 en centro de aorta
D = double(bwdist(M));            %calculo matriz con distancias
D(D<=radio) = 1;                  %distancia es menor al radio, la pinto
D(D>radio) = 0;
end