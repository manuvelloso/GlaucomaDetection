%% RelacionVG
% Inputs: imagen (im)    
% Outputs: VG Relación del area de los vasos sanguíneos con el area del globo ocular

function VG = RelacionVG(im)
% Calcular área del globo ocular
[~, ~, AreaGlobo] = GloboOcular(im);

% Generación de la máscara que contenga unicamente a los vasos del disco
mask = SegmentacionVasos(im);

% Calcular área de los vasos encontrados
AreaVasos = sum(mask(:));

% Área de vasos en relación con el área del globo ocular
VG = AreaVasos/ AreaGlobo;
end
