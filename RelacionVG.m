%% Relaci�n de Vasos sangu�neos con el Globo ocular
% Inputs: imagen (im)    
% Outputs: �rea de los vasos del disco/�rea del globo

function A = RelacionVG(im)

% Generaci�n de la m�scara que contenga unicamente a los vasos del disco
mask = SegmentacionVasos(im);

  figure(1)
  imshowpair(im,mask,'montage');
  %title(['img', num2str(i)]);
  pause(0.5);

% Calcular �rea de los vasos encontrados
AreaVasos = sum(mask(:));

% �rea de vasos en relaci�n con el �rea del globo ocular
A = AreaVasos/AreaGlobo;
end