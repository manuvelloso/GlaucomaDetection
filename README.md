# GlaucomaDetection

Trabajo Final de Procesamiento Digital de Imágenes (PDI): Detección automática de Glaucomas en imágenes de Fondo de Ojos usando herramientas de ML.

Base de datos generada en [kaggle](https://www.kaggle.com/datasets/mailenzino/fondo-de-ojo-glaucoma-normal)


### Estructura

```
Funciones/
├── Procesamiento/             Normalización de imágenes
│   ├── Estandarizacion.m
│   ├── Recorte.m
│   ├── RecorteDisco.m
│   └── NormalizarBlue.m
│
├── Segmentacion/              Detección de estructuras oculares
│   ├── GloboOcular.m
│   ├── MascaraDisco.m
│   ├── OtraMascaraDisco.m
│   ├── MascaraGlobo.m
│   ├── MascaraCircular.m
│   ├── SegmentacionVasos.m
│   ├── CentroVasos.m
│   ├── PruebaNormalizarBlue.m
│   └── MascaraCup.m
│
├── Caracteristicas/           Cálculo de métricas diagnósticas
│   ├── RelacionCD.m           (Cup-to-Disc ratio)
│   ├── RelacionDH.m           (Desplazamiento Horizontal)
│   └── RelacionVD.m           (Vessel-to-Disc ratio)
│
├── Principal/                 Scripts de orquestación
│   ├── GenerarTabla.m
│   └── PreSeleccion.m
│
└── Utilitarios/               Funciones auxiliares y externas
│   └── vesselness2D.m
│
├── Presentación.pdf           Diapositivas usadas para la presentación oral
├── tabla.csv                  Tabla resultado de correr GenerarTabla()
```

## Flujo de procesamiento

```
[IMAGEN] → [PROCESAMIENTO] → [SEGMENTACION] → [CÁLCULO DE FEATURES] → [TABLA]
```

*(!!!) Muy importante: tener paciencia, cada imagen tarda unos minutos...*