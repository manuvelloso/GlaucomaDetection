function Tabla = GenerarTabla_ALG2()
N = 101 + 280; % 101 Glaucomas, 280 normales

Tabla = zeros(N, 1);


for i = 1:101
    im = imread(['C:\Users\vguar\OneDrive\FINAL PDI\TP\1 (',num2str(i),').png']);
    Tabla(i, 1) = RelacionDH(im);
end

for j = 1:280
    im = imread(['C:\Users\vguar\OneDrive\FINAL PDI\TP\0 (',num2str(j),').jpg']);
    Tabla(101 + j, 1) = RelacionDH(im);
end

end