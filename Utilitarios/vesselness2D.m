% Detección de vesselness en 2D (Fracción de tubularidad)
% Calcula la probabilidad de tubularidad local en una imagen 2D
%
% Sintaxis:
%   vesselness = vesselness2D(I, sigmas, spacing, tau, brightondark)
%
% Entrada:
%   I           - Imagen 2D
%   sigmas      - Vector de escalas para calcular vesselness
%   spacing     - Resolución de espaciado de imagen [filas; columnas]
%   tau         - Parámetro de control (0.5-1): uniformidad de respuesta
%   brightondark - Booleano: true si vasos brillan sobre oscuro,
%                  false si oscuros sobre brillante (default para 2D)
%
% Salida:
%   vesselness - Mapa de probabilidad de tubularidad máxima en escalas
%
% Notas:
%   Calcula la respuesta de tubularidad en múltiples escalas
%   usando eigenvalores de la matriz Hessiana. En cada escala,
%   aplica un filtro Gaussiano para detectar estructuras tubulares.
%   El resultado es la respuesta máxima sobre todas las escalas.
%
% Ejemplo:
%   V = vesselness2D(I, 0.5:0.5:2.5, [1;1], 0.3, false);
%
% Referencia:
%   Function escrita por T. Jerman, University of Ljubljana (2014)
%   Basada en código de D. Kroon, University of Twente (2009)


function vesselness = vesselness2D(I, sigmas, spacing, tau, brightondark)
    if nargin<5
        brightondark = false;
    end
    I = single(I);
    for j = 1:length(sigmas)
        [~, Lambda2] = imageEigenvalues(I, sigmas(j), spacing, brightondark);
        if brightondark == true
            Lambda2 = -Lambda2;
        end
        Lambda3 = Lambda2;
        Lambda_rho = Lambda3;
        Lambda_rho(Lambda3 > 0 & Lambda3 <= tau .* max(Lambda3(:))) = tau .* max(Lambda3(:));
        Lambda_rho(Lambda3 <= 0) = 0;
        response = Lambda2.*Lambda2.*(Lambda_rho-Lambda2).* 27 ./ (Lambda2 + Lambda_rho).^3;
        if j == 1
            vesselness = response;
        else
            vesselness = max(vesselness, response);
        end
    end
end

function [Lambda1, Lambda2] = imageEigenvalues(I, sigma, spacing, brightondark)
    Dxx = imgaussian(I, sigma, spacing, [2 0]);
    Dyy = imgaussian(I, sigma, spacing, [0 2]);
    Dxy = imgaussian(I, sigma, spacing, [1 1]);

    Lambda1 = zeros(size(I));
    Lambda2 = zeros(size(I));

    for i = 1:size(I,1)
        for j = 1:size(I,2)
            H = [Dxx(i,j) Dxy(i,j); Dxy(i,j) Dyy(i,j)];
            eigs = eig(H);
            Lambda1(i,j) = max(eigs);
            Lambda2(i,j) = min(eigs);
        end
    end
    if brightondark
        Lambda1 = -Lambda1;
        Lambda2 = -Lambda2;
    end
end

function D = imgaussian(I, sigma, spacing, deriv)
    D = single(zeros(size(I)));
    dim = length(spacing);
    for x = -ceil(3*sigma):ceil(3*sigma)
        if deriv(1) == 0
            g = exp(-(x^2)/(2*sigma^2)) / (sigma * sqrt(2*pi));
        elseif deriv(1) == 1
            g = -(x / (sigma^2)) * exp(-(x^2)/(2*sigma^2)) / (sigma * sqrt(2*pi));
        elseif deriv(1) == 2
            g = (x^2 / (sigma^4) - 1/sigma^2) * exp(-(x^2)/(2*sigma^2)) / (sigma * sqrt(2*pi));
        end
        for y = -ceil(3*sigma):ceil(3*sigma)
            if deriv(2) == 0
                h = exp(-(y^2)/(2*sigma^2)) / (sigma * sqrt(2*pi));
            elseif deriv(2) == 1
                h = -(y / (sigma^2)) * exp(-(y^2)/(2*sigma^2)) / (sigma * sqrt(2*pi));
            elseif deriv(2) == 2
                h = (y^2 / (sigma^4) - 1/sigma^2) * exp(-(y^2)/(2*sigma^2)) / (sigma * sqrt(2*pi));
            end
            ex = ceil(3*sigma)+x+1;
            ey = ceil(3*sigma)+y+1;
            if ex > 0 && ey > 0 && ex <= size(I,1) && ey <= size(I,2)
                for i = max(1,ceil(3*sigma)-x+1):min(size(I,1),size(I,1)+ceil(3*sigma)-x)
                    for j = max(1,ceil(3*sigma)-y+1):min(size(I,2),size(I,2)+ceil(3*sigma)-y)
                        D(i,j) = D(i,j) + I(i,j) * g * h;
                    end
                end
            end
        end
    end
end
