function [BW,D,center] = NormalizarBlue(im, A)
B = im(:,:,3);

[D, center, ~] = MascaraDisco(im); %agarro el disco

% [center, ~] = imfindcircles(D,[15 70]);
% if isempty(center)
%     [D,center,~] = OtraMascaraDisco(im);
%     stats=regionprops(D,'centroid');
%     center=stats.Centroid;
% end

B_h = imadjust(B,[A 1]); %normalizo el hist para valores desde 0.1 a 1
B_h = B_h.*uint8(D); %ajusto y me quedo con la parte del disco
BW = im2bw(B_h, 0.1);
end