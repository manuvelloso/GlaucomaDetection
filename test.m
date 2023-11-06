
for i = 1:101
    im = imread(['C:\Users\vguar\OneDrive\FINAL PDI\TP\1 (',num2str(i),').png']);
    VG = RelacionVG(im);
    
end
for i = 1:375
    im = imread(['C:\Users\vguar\OneDrive\FINAL PDI\TP\0 (',num2str(i),').png']);
    VG = RelacionVG(im);
end
