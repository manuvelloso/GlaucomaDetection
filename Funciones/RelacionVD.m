%% RelacionVG
% Inputs: imagen (im)    
% Outputs: VG Relación del area de los vasos sanguíneos con el area del
% disco

function VD = RelacionVD(im)
% Mascara Disco
[D, ~, ~] = MascaraDisco(im);
AreaD = sum(D(:));

% Generación de la máscara que contenga unicamente a los vasos del disco
mask = SegmentacionVasos(im);

% Calcular área de los vasos encontrados
AreaVasos = sum(mask(:));

% Área de vasos en relación con el área del disco
VD = AreaVasos/AreaD;
end
