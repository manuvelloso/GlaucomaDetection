%% NormalizarBlue
% Inputs : imagen (im), A valor para ajustar la im 
% Outputs : C cup

function C = PruebaNormalizarBlue(im)

% Me quedo solo con el disco
D = RecorteDisco(im);

% Canal azul
B = D(:, :, 3);

B = histeq(B); % Ecualizo el histograma

th = multithresh(B, 2);
B(B > th(2)) = 255;
B(B <= th(2)) = 0;

ee = strel('disk', 3);
B = imerode(B, ee);
B = imdilate(B, ee);
B = imclose(B, ee);
B = bwmorph(B, 'clean');

C = B;

end