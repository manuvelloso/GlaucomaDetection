function [D, center, radio] = OtraMascaraDisco(im)
R = im(:, :, 1);   % Componente Roja
R = imadjust(R); % Ajuste de intensidad

EE = strel('disk',3);
R = imclose(R,EE);
R = imopen(R,EE);
R = imadjust(R);

D = im2bw(R, 0.98);
EE = strel('disk',7); 
D = imerode(D,EE);
D = imdilate(D,EE);

stats = regionprops(D,'Centroid','MajorAxisLength','MinorAxisLength');
center = stats.Centroid;
diametro = mean([stats.MajorAxisLength stats.MinorAxisLength],2);
radio = diametro/2;
end