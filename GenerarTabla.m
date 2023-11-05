function Tabla = GenerarTabla()
N = 101 + 101; % 101 Glaucomas, 280 normales

Tabla = zeros(N, 4);

% Etiqueta
Tabla(1:101, 1)  = 1;  % Con glaucoma
Tabla(102:202, 1) = 0; % Normal

for i = 1:101
    im = imread(['C:\Users\vguar\OneDrive\FINAL PDI\TP\1 (',num2str(i),').png']);
    [CD,~,~] = PruebaCD(im);
    DH = RelacionDH(im);
    VG = RelacionVG(im);
    Tabla(i, 2) = CD;
    Tabla(i, 3) = DH;
    Tabla(i, 4) = VG;
    i
end

for j = 1:101
    im = imread(['C:\Users\vguar\OneDrive\FINAL PDI\TP\0 (',num2str(j),').png']);
    [CD,~,~] = PruebaCD(im);
    DH = RelacionDH(im);
    VG = RelacionVG(im);
    Tabla(101 + j, 2) = CD;
    Tabla(101 + j, 3) = DH;
    Tabla(101 + j, 4) = VG;
    j
end

T = array2table(Tabla, 'VariableNames', {'Glaucoma', 'CD', 'DH', 'VG'});
[Nombre, direccion] = uiputfile({'*.csv','TABLA_SUMA'}, 'Guardar Como');
writetable(T,[direccion, Nombre]);

end