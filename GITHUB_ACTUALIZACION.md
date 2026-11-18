# Actualizar martinsalinasb.github.io con GitHub Desktop

1. Descomprime el ZIP completo y abre la carpeta que contiene `index.html`, `css/`, `docs/`, `img/` y `js/`.
2. En GitHub Desktop, abre el repositorio `martinsalinasb/martinsalinasb.github.io`. Si no está en tu computador, usa **File > Clone repository**. Si ya está clonado, selecciona **Fetch origin** y luego **Pull origin** si corresponde.
3. Usa **Repository > Show in Explorer** para abrir la carpeta local del repositorio.
4. Copia el contenido de la carpeta descomprimida dentro de la carpeta del repositorio y acepta reemplazar archivos existentes. `index.html` debe quedar directamente en la raíz.
5. **Si habías publicado la versión con videos y capturas, elimina las carpetas antiguas** `media/` e `img/conferences/` desde la carpeta del repositorio. Esto es importante: copiar los archivos nuevos no elimina automáticamente los anteriores.
6. Si quedaran CV antiguos duplicados en la raíz, elimínalos. Los vigentes están en `docs/cv-martin-salinas-en.pdf` y `docs/cv-martin-salinas-es.pdf`.
7. En GitHub Desktop, revisa **Changes**, escribe `Simplify conferences to PDF download links` y selecciona **Commit to main**, o a la rama que use tu sitio.
8. Pulsa **Push origin**. En GitHub, comprueba **Settings > Pages** y mantén la configuración de publicación que ya funcionaba (usualmente rama `main`, carpeta `/(root)`).
9. Abre `https://martinsalinasb.github.io`, recarga con `Ctrl + F5` y verifica los dos botones **Download presentation (PDF)**, el selector English/Español, los dos CV y el logo de PoliMi.

Los PDF incluidos son descargables con el atributo HTML `download`. Los certificados de las charlas no estaban adjuntos y no se muestran en esta versión.
