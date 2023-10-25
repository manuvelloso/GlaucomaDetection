function Area = AreaVasos(mask,AreaGlobo)
AreaVasos = sum(mask(:));
Area = AreaVasos/AreaGlobo;
end