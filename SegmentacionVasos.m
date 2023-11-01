%% Segementacion de vasos
% Inputs: imagen (im) 
% Outputs: mascara binarizada con los vasos sanguíneos del disco

function Vasos = SegmentacionVasos(im)
% Preprocesamiento de Imagen
Ic = single(im);
thr = prctile(Ic(Ic(:)>0),1) * 0.9;
Ic(Ic<=thr) = thr;
Ic = Ic - min(Ic(:));
Ic = Ic ./ max(Ic(:));

V2 = vesselness2D(Ic, 0.5:0.5:2.5, [1;1], 0.3, false);

aux = V2;                   %Variable auxiliar
V2(:,:,2)=0;                %Canal Green a cero
V2(:,:,3)=0;                %Canal Blue a cero

Result = aux - V2;          %Eliminación de componente roja
Result(:,:,3)=0;            %Solo componente verde (los vasos)

% Binarización
th = multithresh(Result,1);
bw = im2bw(Result,th);

% Operaciones Morfológicas
bw1 = bwmorph(bw,'clean');
bw2 = bwareaopen(bw1,16);
bw3 = bwmorph(bw2,'skel');

% Obtención de la máscara del disco 
mask = MascaraDisco(im);

% Vasos sanguíneos del disco
Vasos = mask.*bw3;
end