function R_DH = RelacionDH(im)

[bw, center, Vasos, ~] = MascaraDiscoPEAK(im);
ee = strel('line', 2, 90);
Vasos = imerode(Vasos, ee);

[~, x] = find(Vasos == 1);

x_mean = floor(mean(x));
R_DH = abs(center(1,1) - x_mean);

% figure(1)
% subplot(1,2,1)
% imshowpair(im, bw);
% subplot(1,2,2)
% imshowpair(bw, Vasos)
% hold on
% plot(x_mean, center(1,2), 'r*',center(1,1), center(1,2), 'b*');
% hold off
% pause(0.02)
end