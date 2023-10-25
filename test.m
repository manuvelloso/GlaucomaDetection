cont=0;
for i=1:101
    im=imread(['1 (',num2str(i),').png']);
    [~,cont]=RelacionCD(im,cont);
end
for i=1:280
    im=imread(['0 (',num2str(i),').jpg']);
    [~,cont]=RelacionCD(im,cont);
end

%im=imread(['0 (',num2str(i),').png');
    