function MascaraDiscoPEAK(I)
Ig = rgb2gray(I);
% Preprocesamiento de Imagen todo esto es igual a segmentacion vasos pq
% necesitaba centro y radio
Ic = single(I);
thr = prctile(Ic(Ic(:)>0),1) * 0.9;
Ic(Ic<=thr) = thr;
Ic = Ic - min(Ic(:));
Ic = Ic ./ max(Ic(:));

V2 = vesselness2D(Ic, 0.5:0.5:2.5, [1;1], 0.3, false);
aux = V2;
V2(:,:,1)=0;

R = aux - V2;  %Borro componente G y B
R(:,:,2)=0;
R(:,:,3)=0;
R = rgb2gray(R);
[center, radii] = imfindcircles(I,[15 70],'ObjectPolarity','dark','Sensitivity',0.9);

if isempty(center)
    D = OtraMascaraDisco(I);
    stats=regionprops(D,'centroid');
    center=stats.Centroid;
end
% tengo centro y radio del disco
mask = SegmentacionVasos(I);                    %obtengo los vasos en el disco
M = zeros(size(mask));                          %armo matriz de ceros
M(round(center(1,2)),round(center(1,1))) = 1;   % 1 en centro
A = double(bwdist(M));                          % para calcular matriz de distancia
M(A<15)=1;
M(A>=15)=0;
mask=mask&M;                                % si el vaso sale del radio cerca al centro va a cero

ee=strel('square',1);
mask=imerode(mask,ee);  %erosion
ee=strel('square',2);
mask=imclose(mask,ee);  %cierre= dilat + erosion

figure(1)
imshowpair(I,mask,'blend');
pause(0.1)

end