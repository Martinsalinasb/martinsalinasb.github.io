# Contenido de la web — versión simplificada (18 de noviembre de 2026)

## Incluido

La web incluye los CV generales proporcionados en `docs/cv-martin-salinas-en.pdf` y `docs/cv-martin-salinas-es.pdf`, enlazados según el idioma seleccionado.

En la sección de congresos, cada tarjeta tiene una descripción bilingüe y **un único enlace de descarga**:

- Dresde, MPF2026: `docs/conferences/mpf2026-presentation.pdf` (19 páginas: charla y referencias, sin notas ni diapositivas de respaldo).
- Talca, C2MC2026: `docs/conferences/c2mc2026-presentation.pdf` (14 páginas de la charla principal).

Se eliminaron deliberadamente los videos incrustados y las capturas de diapositivas, junto con sus archivos originales. Ninguno de ellos es necesario para la publicación. Los PPTX originales tampoco se publican para no exponer notas internas.

La beca The Bridge incluye el logo original de Politecnico di Milano en `img/awards/polimi-logo.png`, sin presentarlo como certificado.

## Material opcional pendiente

No se han adjuntado los certificados de presentación de los congresos. Si más adelante decides publicarlos, puedes guardarlos como `docs/conferences/mpf2026-certificate.pdf` y `docs/conferences/c2mc2026-certificate.pdf`, pero **no hay enlaces a esos certificados en la versión simplificada**.

Los informes PDF de los proyectos antiguos se mantienen. Algunas imágenes antiguas podrían mejorarse sustituyéndolas por copias de mayor resolución con los mismos nombres.

## Publicación y limpieza

Copia todos los archivos y carpetas de este paquete a la raíz del repositorio GitHub Pages. Si ya publicaste la versión anterior, **borra en el repositorio** las carpetas `img/conferences/` y `media/` que contenían capturas y videos (copiar encima no elimina archivos antiguos).

Conserva la estructura `index.html`, `css/`, `js/`, `img/`, `docs/` y `lib/`. El sitio es estático; no requiere compilación. Puedes previsualizarlo mediante `python -m http.server 8000`.
