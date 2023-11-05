% sin usar la restriccion de center podriamos quedarnos con todo el area que no es atravezada x los vasos
% dist de M cambia si nos quedamos con la sup
function [bw, center, Vasos, PacMan] = MascaraDiscoPEAK(im) 
% B = im(:,:,3);
[bw,~,center] = NormalizarBlue(im, 0.1);

% agarro vasos para restar al disco
Vasos = SegmentacionVasos(im);
Vasos = bwmorph(Vasos,'shrink');

%voy a ignorar lo que este muy lejos del centro
M = zeros(size(Vasos));                         %armo matriz de ceros
M(round(center(1,2)), round(center(1,1))) = 1;  % 1 en centro del DISCO
A = double(bwdist(M));                          % para calcular matriz de distancia
M(A <= 10) = 1;
M(A > 10) = 0;
Vasos=Vasos&M;                                  %me quedo con los vasos a distancia <10 
eeS=strel('square',1);
Vasos=imerode(Vasos,eeS);  %erosion
ee=strel('square',2);
Vasos=imclose(Vasos,ee);
Vasos=imdilate(Vasos,eeS);

M(A < 13) = 1;                                      %me quedo con comp verde <13
bw = bw&M;
eeD = strel('disk',1);
bw = imdilate(bw,eeD);                            %dilato lo verde D=1

PacMan = bw - Vasos;
PacMan = imerode(PacMan, eeD);                     %erosion + apertura D=1
PacMan = imopen(PacMan, eeD);

PacMan = PacManFunc(PacMan); % esto lo hice para quedarme con el pacman

% figure(1)
% subplot(131)
% imshowpair(B,bw)
% title('componente azul binarizada')
% subplot(132)
% imshowpair(B,Vasos)
% title('vasos desde SegmentacionVasos')
% subplot(133)
% imshowpair(im,PacMan)
% title('PacMan')
% pause(0.02)
end