% Relación Vasos-Disco
% Calcula la relación entre el área de vasos y el área del disco
%
% Sintaxis:
%   VD = RelacionVD(im)
%
% Entrada:
%   im - Imagen original RGB del fondo de ojo
%
% Salida:
%   VD - Relación Vasos/Disco (ratio entre 0 y 1)
%
% Descripción:
%   Detecta la máscara del disco y la máscara de vasos
%   sanguíneos, calcula ambas áreas y obtiene su relación.
%   Esta característica proporciona información sobre la
%   densidad vascular en relación al tamaño del disco.
%
% Notas:
%   - Valores mayores indican mayor densidad vascular
%   - Puede estar asociado a cambios glaucomatosos
%
% Ver también: RelacionCD, RelacionDH, SegmentacionVasos
%
% Sistema de Detección de Glaucoma

function VD = RelacionVD(im)
    % Máscara Disco
    [D, ~, ~] = MascaraDisco(im);
    AreaD = sum(D(:));

    % Generación de la máscara que contenga únicamente los vasos del disco
    mask = SegmentacionVasos(im);

    % Calcular área de los vasos encontrados
    AreaVasos = sum(mask(:));

    % Área de vasos en relación con el área del disco
    VD = AreaVasos/AreaD;
end
