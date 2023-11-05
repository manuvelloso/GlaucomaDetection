function [CD,C,D] = PruebaCD(im) 
% B=im(:,:,3);

%obtencion del disco
[D,center,radio] = MascaraDisco(im); 

%obtencion del cup
[C,~,~]=NormalizarBlue(im,0.37);

% [center, radio] = imfindcircles(D,[15 70]);
% if (isempty(center)||isempty(radio))
%     D = OtraMascaraDisco(im);
%     stats = regionprops(D,'Centroid','MajorAxisLength','MinorAxisLength');
%     center=stats.Centroid;
%     diametro = mean([stats.MajorAxisLength stats.MinorAxisLength],2);
%     radio = diametro/2;
% end

if (sum(sum(C))<50)
    [C,~,~] = NormalizarBlue(im,0.18);
end

M = zeros(size(C));                             %armo matriz de ceros
M(round(center(1,2)),round(center(1,1))) = 1;   % 1 en centro del DISCO
A = double(bwdist(M));                          % para calcular matriz de distancia
M(A < radio) = 1;
D = D&M;
C = C&M;

Area_C = sum(C(:));
Area_D = sum(D(:));

CD = imdivide(Area_C, Area_D);

% figure(1)
% subplot(121)
% imshowpair(B,D)
% title('DISK')
% subplot(122)
% imshowpair(B,C)
% title('CUP')
% pause(0.02)

end