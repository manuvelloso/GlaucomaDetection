%% CentroVasos
% Input: imagen (im)
% Output: centro del disco (center), Vasos
function [center, Vasos] = CentroVasos(im) 

[~,~,center] = NormalizarBlue(im, 0.1);

% agarro vasos para restar al disco
Vasos = SegmentacionVasos(im);
Vasos = bwmorph(Vasos,'shrink');

% voy a ignorar lo que este muy lejos del centro
M = zeros(size(Vasos));                         % armo matriz de ceros
M(round(center(1,2)), round(center(1,1))) = 1;  % 1 en centro del DISCO
A = double(bwdist(M));                          % para calcular matriz de distancia
% me quedo con los vasos a distancia <10 
M(A <= 10) = 1;
M(A > 10) = 0;
Vasos = Vasos&M; 

% Filtro morfológico de los vasos
eeS = strel('square',1);
Vasos = imerode(Vasos,eeS); 
ee = strel('square',2);
Vasos = imclose(Vasos,ee);
Vasos = imdilate(Vasos,eeS);

end