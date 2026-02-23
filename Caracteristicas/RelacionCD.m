% Relación Copa-Disco
% Calcula la relación entre el área de la copa y el área del disco
%
% Sintaxis:
%   CD = RelacionCD(im)
%
% Entrada:
%   im - Imagen original RGB del fondo de ojo
%
% Salida:
%   CD - Relación Copa/Disco (ratio entre 0 y 1)
%
% Descripción:
%   Detecta el disco y la copa, calcula ambas áreas y
%   obtiene su relación. Si el área de la copa es muy pequeña,
%   recalcula con un parámetro de ajuste menor (A=0.18).
%   Esta característica es uno de los indicadores clave
%   para el diagnóstico de glaucoma.
%
% Notas:
%   - Valores mayores sugieren mayor presencia de glaucoma
%   - Margen normal: 0.3-0.6
%
% Ver también: RelacionDH, RelacionVD, MascaraDisco
%
% Sistema de Detección de Glaucoma

function CD = RelacionCD(im)
    % Obtención del disco
    [D, center, radio] = MascaraDisco(im);

    % Obtención del cup
    C = PruebaNormalizarBlue(im);

    % Si el área del cup es muy pequeña, recalcular
    if (sum(C(:)) < 50)
        [C, ~, ~] = NormalizarBlue(im, 0.18);
    end

    M = zeros(size(D));
    M(round(center(1,2)), round(center(1,1))) = 1;
    A = double(bwdist(M));
    M(A < radio) = 1;
    D = D&M;

    % Cálculo de áreas
    Area_D = sum(D(:));
    Area_C = sum(C(:));

    % Cálculo de CD
    CD = imdivide(Area_C, Area_D);
end
