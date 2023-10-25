function [CD] = RelacionCD(im)
im = imresize(im,[560 720]); 

% Componentes roja y verde
R = im(:,:,1); 
G = im(:,:,2); 

% Ajuste de intensidad
G_i = imadjust(G); 
R_i = imadjust(R);

% Elemento estructurante tamaño 15
EE = strel('disk',10);  

% Operaciones morfologicas -------

% Cerradura
R = imclose(R_i,EE);        
G = imclose(G_i,EE);           

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

A_disco = sum(R_bw(:));
A_copa = sum(G_bw(:));
CD = imdivide(A_copa,A_disco);

figure(1)
subplot(231),imshow(im),title(['Imagen normal',num2str(CD)])
subplot(232),imshow(R),title('Componente roja')
subplot(233),imshow(R_bw),title('Area del disco')
subplot(234),imshow(G),title('Componente verde')
subplot(235),imshow(G_bw),title('Cup Area')
pause(0.1)

if(sum(G_bw)==0) % se nos hizo cero el cup
   [CD,G_bw]=AjusteCup(G_i,G_bw,R_bw);
end
if(CD<0.06) %disk es muy grande
    CD=funcion(R_i,G_bw);
end


end
