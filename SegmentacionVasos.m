%% Segementacion de vasos

% Inputs: imagen (I), centro del globo y su radio
%         previamente se debe llamar a GloboOcular(I)
%         [centro, radio, AreaGlobo] = GloboOcular(I); 
% Outputs: mascara binarizada con los vasos sanguíneos

function Vasos = SegmentacionVasos(I,centro,radio)

I = rgb2gray(I);

% Preprocesamiento de Imagen
Ip = single(I);
thr = prctile(Ip(Ip(:)>0),1) * 0.9;
Ip(Ip<=thr) = thr;
Ip = Ip - min(Ip(:));
Ip = Ip ./ max(Ip(:));

V = vesselness2D(Ip, 0.5:0.5:2.5, [1;1], 0.3, false);

th = multithresh(V,1);
bw = im2bw(V,th);

bw1 = bwmorph(bw,'clean');
bw2 = bwareaopen(bw1,40);

bw3 = bwmorph(bw2,'dilate');
bw4 = bwmorph(bw3,'erode');

mask = MascaraGlobo(size(I),centro, radio-2); 
%le resto 2 pixeles para sacarle el borde blanco
Vasos = mask.*bw4;
end