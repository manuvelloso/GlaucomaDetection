function im_new = RecorteDisco(im)

[~, centro, r] = MascaraDisco(im);
x0 = centro(1);
y0 = centro(2);
tam = floor((r+1));

[h, w, ~] = size(im);  % dimensiones de la imagen

if (x0 + tam) < w && (x0 - tam) > 0 && (y0 + tam) < h && (y0 - tam) > 0
    im_new = im(y0 - tam:y0 + tam, x0 - tam:x0 + tam, :);
else
    im_new = im;
end

end