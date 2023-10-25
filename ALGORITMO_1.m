function CD = RelacionCD(im)
im = imresize(im,[560 720]); 

% Componentes roja y verde
R = im(:,:,1); 
G = im(:,:,2); 

% Ajuste de intensidad
G = imadjust(G); 
R = imadjust(R);

% Elemento estructurante tamaño 15
EE = strel('disk',10);  

% Operaciones morfologicas -------

% Cerradura
R = imclose(R,EE);        
G = imclose(G,EE);           

% Aperura
R = imopen(R,EE);   
G = imopen(G,EE);
R = imadjust(R);   

% Umbralizacion ------------------
R_bw = im2bw(R, 0.98); 
G_bw = im2bw(G, 0.999);

%Elemento estructurante tamaño 20
EE = strel('disk',20);  

% Erosion
R_bw = imerode(R_bw,EE);
G_bw = imerode(G_bw,EE);

% Dilatacion
R_bw = imdilate(R_bw,EE);

%Elemento estructural tamaño 10
EE = strel('disk',10); 
G_bw = imdilate(G_bw,EE);

% Componente roja
figure,
subplot(131),imshow(im),title('Imagen normal')
subplot(132),imshow(R),title('Componente roja')
subplot(133),imshow(R_bw),title('Area del disco')

% Componente verde
figure,
subplot(131),imshow(im),title('Imagen normal')
subplot(132),imshow(G),title('Componente verde')
subplot(133),imshow(G_bw),title('Cup Area')

A_disco = sum(R_bw(:));
A_copa = sum(G_bw(:));

% Relacion copa al disco    
CD = imdivide(A_copa,A_disco);

end
