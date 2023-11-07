%% NormalizarBlue
% Inputs : imagen (im), A valor para ajustar la im 
% Outputs : BW máscara, D disco, center

function [BW, D, center] = PruebaNormalizarBlue(im)
BW = 0;
D = 0;
center = 0;
B = im(:, :, 3);

[D, center, ~] = MascaraDisco(im); %agarro el disco

B = B.*uint8(D);
B = imadjust(B, [0.1 1]);

H = imhist(B);

figure(1)
subplot(121)
imshow(B)
subplot(122)
bar(H);
pause(0.5)
% B_h = imadjust(B,[A 1]); % normalizo el hist para valores desde A a 1
% B_h = B_h.*uint8(D); % ajusto y me quedo con la parte del disco

% BW = im2bw(B_h, 0.1);
end