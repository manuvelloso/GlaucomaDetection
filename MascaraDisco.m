%% Segementacion de vasos
% Inputs: imagen (im) 
% Outputs: mascara binarizada del disco

function D = MascaraDisco(im)
Ig = rgb2gray(im);              %Imagen en escala de grises

% Preprocesamiento de Imagen
Ic = single(im);
thr = prctile(Ic(Ic(:)>0),1) * 0.9;
Ic(Ic<=thr) = thr;
Ic = Ic - min(Ic(:));
Ic = Ic ./ max(Ic(:));

V2 = vesselness2D(Ic, 0.5:0.5:2.5, [1;1], 0.3, false);
aux = V2;                       %Variable auxiliar
V2(:,:,1)=0;                    %Canal Red a cero

R = aux - V2;                   %Elimina Canal Green y Blue
R(:,:,2)=0;                     %Canal Green a cero
R(:,:,3)=0;                     %Canal Blue a cero

R = rgb2gray(R);                %Imagen Roja a escala de grises
% imshow(R);
[center, radio] = imfindcircles(R,[15 70],'ObjectPolarity','dark','Sensitivity',0.9);
% viscircles(center, radii,'EdgeColor','b');
% pause(0.5);

if center ~= 0
    D = MascaraCircular(size(Ig),center,radio);
else
    D = OtraMascaraDisco(im);
end
end