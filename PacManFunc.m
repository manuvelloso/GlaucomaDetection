function PM=PacManFunc(PM)
%me quedo solo con el pacman
[PM,N]=bwlabel(PM);
if(N>1)
    stats=regionprops(PM,'Area');
    maxArea=max([stats.Area]);
    for i=1:N
            if(stats(i).Area~=maxArea)
                PM(PM==i)=0;
            end
    end
end
end