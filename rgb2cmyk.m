function im_cmyk = rgb2cmyk(im)

% Normalizo
im = double(im) / 255;

% Canales RGB
R = im(:, :, 1);
G = im(:, :, 2);
B = im(:, :, 3);

% Canales CMY
C = 1 - R;
M = 1 - G;
Y = 1 - B;

% Canal K (negro)
K = min(min(C, M), Y);

% Ajuste de canales CMY restando el canal K
C = (C - K);
M = (M - K);
Y = (Y - K);

% Imagen CMYK
im_cmyk = cat(3, C, M, Y, K);

% Rango correcto [0, 1]
im_cmyk(im_cmyk < 0) = 0;
im_cmyk(im_cmyk > 1) = 1;

end