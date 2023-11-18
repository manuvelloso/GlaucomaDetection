%% Generar Tabla
% Input: [ ]
% Output: Tabla con las etiquetas y los 3 features: CD, DH, VG (Tabla)
function Tabla = GenerarTabla()
N = 323 + 307; 

Tabla = zeros(N, 4);

% Etiqueta
Tabla(1:307, 1)  = 1;  % Con glaucoma
Tabla(307 + 1:323+307, 1) = 0; % Normal

% Cargo los datos con glaucoma
for i = 1:307
    im = imread(['C:\Users\vguar\OneDrive\FINAL PDI\TP\1 (',num2str(i),').png']);
    Tabla(i, 2) = RelacionDH(im);
    Tabla(i, 3) = RelacionVD(im);
    Tabla(i, 4) = RelacionCD(im);
    i
end

for j = 1:323
    im = imread(['C:\Users\vguar\OneDrive\FINAL PDI\TP\0 (',num2str(j),').png']);
    Tabla(j + 307, 2) = RelacionDH(im);
    Tabla(j + 307, 3) = RelacionVD(im);
    Tabla(j + 307, 4) = RelacionCD(im);
    j
end

T = array2table(Tabla, 'VariableNames', {'Glaucoma', 'DH', 'VG', 'CD'});
[Nombre, direccion] = uiputfile({'*.csv','TABLA'}, 'Guardar Como');
writetable(T,[direccion, Nombre]);

end