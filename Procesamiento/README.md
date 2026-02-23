# Procesamiento

Funciones para normalización y preparación de imágenes antes del análisis.

## Funciones

### Estandarizacion.m
Normaliza el tamaño de las imágenes a un estándar de 225x225 píxeles y realiza rectificación.

### Recorte.m
Extrae una región cuadrada del globo ocular a partir de la imagen original.

### RecorteDisco.m
Extrae una región cuadrada centrada en el disco óptico.

### NormalizarBlue.m
Normaliza la intensidad del canal azul para mejorar la visibilidad de estructuras.

## Flujo de procesamiento
```
Imagen Original → Detectar Globo → Recortar → Redimensionar → Imagen Normalizada
```
