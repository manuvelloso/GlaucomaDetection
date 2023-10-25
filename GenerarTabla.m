function Tabla = GenerarTabla()
N = 101 + 280; % 101 Glaucomas, 280 normales

Tabla = zeros(N, 2);

% Etiqueta
Tabla(1:101, 1)  = 1; % Con glaucoma
Tabla(102:280, 1) = 0; % Normal

for i = 1:101
    im = imread(['C:\Users\vguar\OneDrive\FINAL PDI\TP\1 (',num2str(i),').png']);
    Tabla(i, 2) = RelacionCD(im);  
end

for j = 1:280
    im = imread(['C:\Users\vguar\OneDrive\FINAL PDI\TP\0 (',num2str(j),').jpg']);
    Tabla(101 + j, 2) = RelacionCD(im);
end

end