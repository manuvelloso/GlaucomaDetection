function C = MascaraCopa(im)
C = im(:,:,2); 
C = imadjust(C); 

% Elemento estructurante tamaño 10
EE = strel('disk',5); 

C = imclose(C,EE);
C = imopen(C,EE);

%Elemento estructurante tamaño 20
EE = strel('disk',7); 

C = im2bw(C, 0.999);
C = imerode(C,EE);

EE = strel('disk',5); 
C = imdilate(C,EE);


figure(1)
imshowpair(C, im)
pause(0.6)

end