function A = RelacionVG(im)

[centro, radio, AreaGlobo] = GloboOcular(im);
mask = SegmentacionVasos(im,centro,radio);

AreaVasos = sum(mask(:));
A = AreaVasos/AreaGlobo;
end