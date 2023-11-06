%% Generar Tabla
% Input: [ ]
% Output: Tabla con las etiquetas y los 3 features: CD, DH, VG (Tabla)
function Tabla = GenerarTabla()
N = 162 + 162; 

Tabla = zeros(N, 4);

% Etiqueta
Tabla(1:162, 1)  = 1;  % Con glaucoma
Tabla(163:163 + 162, 1) = 0; % Normal

% Cargo los datos con glaucoma
for i = 1:162
    im = imread(['C:\Users\vguar\OneDrive\FINAL PDI\TP\1 (',num2str(i),').png']);
    Tabla(i, 2) = RelacionCD(im);
    Tabla(i, 3) = RelacionDH(im);
    Tabla(i, 4) = RelacionVG(im);
end

for j = 1:162
    im = imread(['C:\Users\vguar\OneDrive\FINAL PDI\TP\0 (',num2str(j),').png']);
    Tabla(j + 162, 2) = RelacionCD(im);
    Tabla(j + 162, 3) = RelacionDH(im);
    Tabla(j + 162, 4) = RelacionVG(im);
end

T = array2table(Tabla, 'VariableNames', {'Glaucoma', 'CD', 'DH', 'VG'});
[Nombre, direccion] = uiputfile({'*.csv','tabla'}, 'Guardar Como');
writetable(T,[direccion, Nombre]);

end