%% Segementacion de vasos

% Inputs: imagen (I), centro del globo y su radio
%         previamente se debe llamar a GloboOcular(I)
%         [centro, radio, AreaGlobo] = GloboOcular(I); 
% Outputs: mascara binarizada con los vasos sanguíneos

function Vasos = SegmentacionVasos(I,centro,radio)

Ig = rgb2gray(I);

% Preprocesamiento de Imagen

Ic = single(I);
thr = prctile(Ic(Ic(:)>0),1) * 0.9;
Ic(Ic<=thr) = thr;
Ic = Ic - min(Ic(:));
Ic = Ic ./ max(Ic(:));

V2 = vesselness2D(Ic, 0.5:0.5:2.5, [1;1], 0.3, false);

aux = V2;
V2(:,:,2)=0;
V2(:,:,3)=0;

Result = aux - V2;  %Borro componente roja
G = Result(:,:,2);  %Me quedo con la componente verde (los vasos)
th = multithresh(G,1);
bw = im2bw(G,th);

bw1 = bwmorph(bw,'clean');
bw2 = bwareaopen(bw1,40);

bw3 = bwmorph(bw2,'dilate');
bw4 = bwmorph(bw3,'erode');

mask = MascaraGlobo(size(Ig),centro, radio-2); 
%le resto 2 pixeles para sacarle el borde blanco

Vasos = mask.*bw4;
end
