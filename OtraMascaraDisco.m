%% Otra forma de encontrar la máscara para el disco óptico
% Inputs: imagen (im)
% Output: mascara binarizada del disco

function D = OtraMascaraDisco(im)
R = im(:,:,1);              %Componente Roja
R = imadjust(R);            %Ajuste de intensidad

EE = strel('disk',3);       %Elemento estructurante

% Operaciones morfológicas
R = imclose(R,EE);
R = imopen(R,EE);
R = imadjust(R);

% Binarización
D = im2bw(R, 0.98);

EE = strel('disk',7);       %Elemento estructurante

% Operaciones morfológicas
D = imerode(D,EE);
D = imdilate(D,EE);
end