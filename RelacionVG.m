%% Relación de Vasos sanguíneos con el Globo ocular
% Inputs: imagen (im)    
% Outputs: área de los vasos del disco/área del globo

function A = RelacionVG(im)
% Calcular centro, radio y área del globo ocular
[~, ~, AreaGlobo] = GloboOcular(im);

% Generación de la máscara que contenga unicamente a los vasos del disco
mask = SegmentacionVasos(im);

  figure(1)
  imshowpair(im,mask,'montage');
  %title(['img', num2str(i)]);
  pause(0.5);

% Calcular área de los vasos encontrados
AreaVasos = sum(mask(:));

% Área de vasos en relación con el área del globo ocular
A = AreaVasos/AreaGlobo;
end
