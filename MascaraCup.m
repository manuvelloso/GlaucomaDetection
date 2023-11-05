function C = MascaraCup(im)
C = im(:,:,2); 
th = multithresh(C, 8);
C = im2bw(C, double(th(7))/255);
mask = MascaraDisco(im);
C = mask.*C;

figure(1)
imshowpair(C, im)
pause(0.6)
end