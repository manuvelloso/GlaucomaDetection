%% Relaci�n de vasos sangu�neos con el globo ocular
% Inputs: imagen (im)    
% Outputs: CD �rea de la copa/ �rea del disco

function CD = RelacionCD(im) 

% Obtencion del disco
[D, center, radio] = MascaraDisco(im); 

% Obtencion del cup
[C, ~, ~] = NormalizarBlue(im, 0.37);

% Si el �rea del cup es peque�a, lo vuelvo a calcular pero con un A chico
if (sum(C(:)) < 50)
    [C, ~, ~] = NormalizarBlue(im, 0.18);
end

M = zeros(size(C));                             % Armo matriz de ceros
M(round(center(1,2)),round(center(1,1))) = 1;   % 1 en centro del DISCO
A = double(bwdist(M));                          % para calcular matriz de distancia
M(A < radio) = 1;
D = D&M;
C = C&M;

% C�lculo de �reas
Area_D = sum(D(:));
Area_C = sum(C(:));

% C�lculo de CD
CD = imdivide(Area_C, Area_D);

end