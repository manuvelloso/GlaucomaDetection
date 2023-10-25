function R_DH = RelacionDH(im)
im = imresize(im,[560 720]); 
% Componentes roja y verde
R = im(:,:,1); 
G = im(:,:,2); 

G = imadjust(G);

% Elemento estructurante tamaño 10
EE = strel('disk', 10); 

% Operaciones morfologicas -------

% Cerradura
R = imclose(R, EE);

% Apertura
R = imopen(R, EE);

% Umbralizacion ------------------
th = 0.98;
R_bw = im2bw(R,th);
R_bw = imclearborder(R_bw);

% Elemento estructurante tamaño 20
EE = strel('disk',10);  
R_bw = imerode(R_bw, EE);
R_bw = imdilate(R_bw, EE);

% Máscara ------------------------
G_m = G.*uint8(R_bw); 

[x,y] = find(G_m == max(max(G_m)));
x1 = mean(x); 
y1 = mean(y);

% Filtramos el fondo la la imagen 
EE = strel('disk', 20);
G_bh = imbothat(G_m, EE);

figure(1)
subplot(121)
imshow(R_bw)
title('Mascara')

subplot(122)
imshow(G_bh)
title('Aplicada')
pause(0.2)
[x,y] = find(G_bh == max(max(G_bh)));
x2 = mean(x);
y2 = mean(y);

% Distancia entre el centro del disco optico y la cabeza del nervio optico
v = [abs(x2 - x1),abs(y2 - y1)];
R_DH = norm(v);

% Relacion distancia entre el disco y el nervio con distancia disco
info = regionprops(R_bw,'MajorAxisLength','MinorAxisLength');
D = mean([info.MajorAxisLength info.MinorAxisLength], 2);

R_DH = R_DH/D;

if isempty(R_DH)
    R_DH = 0;
end

end






