%% RelacionVG
% Inputs: imagen (im)    
% Outputs: VG Relaci�n del area de los vasos sangu�neos con el area del
% disco

function VD = RelacionVD(im)
% Mascara Disco
[D, ~, ~] = MascaraDisco(im);
AreaD = sum(D(:));

% Generaci�n de la m�scara que contenga unicamente a los vasos del disco
mask = SegmentacionVasos(im);

% Calcular �rea de los vasos encontrados
AreaVasos = sum(mask(:));

% �rea de vasos en relaci�n con el �rea del disco
VD = AreaVasos/AreaD;
end
