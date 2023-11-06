%% SegementacionVasos
% Inputs: imagen (im) 
% Outputs: mascara binarizada con los vasos sanguineos del disco

function Vasos = SegmentacionVasos(im)
% Preprocesamiento de Imagen
Ic = single(im);
thr = prctile(Ic(Ic(:)>0),1) * 0.9;
Ic(Ic<=thr) = thr;
Ic = Ic - min(Ic(:));
Ic = Ic ./ max(Ic(:));

% Funci�n de MathWorks
V2 = vesselness2D(Ic, 0.5:0.5:2.5, [1;1], 0.1, false);

aux = V2;                   % Variable auxiliar
V2(:,:,2)=0;                % Canal Green a cero
V2(:,:,3)=0;                % Canal Blue a cero

G = aux - V2;          % Eliminaci�n de componente roja
G(:,:,3)=0;            % Solo componente verde (los vasos)

% Binarizaci�n
th = multithresh(G,1);
bw_G = im2bw(G,th);

% Operaciones morfol�gicas
bw_G = bwmorph(bw_G,'clean');
bw_G = bwmorph(bw_G,'thin');
bw_G = bwareaopen(bw_G,6);

% Obtenci�n de la m�scara del disco 
mask = MascaraDisco(im);

% Vasos sangu�neos del disco
Vasos = mask.*bw_G;

end
