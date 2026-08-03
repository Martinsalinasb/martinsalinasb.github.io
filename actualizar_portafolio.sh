#!/usr/bin/env bash

set -e

ROOT="/c/Users/Msali/OneDrive/Documentos/Proyectos_personales/pagina_web"
SOURCE="$ROOT/personal-portfolio-website-template"
REPO="$ROOT/final/martinsalinasb.github.io"

cd "$REPO"

git config --global user.name "Martín Salinas"
git config --global user.email "martin.salinas@uc.cl"

renombrar() {
    ORIGINAL="$1"
    NUEVO="$2"

    if [ -f "$ORIGINAL" ] && [ "$ORIGINAL" != "$NUEVO" ]; then
        TEMPORAL="${NUEVO}.temporal"

        mv -f "$ORIGINAL" "$TEMPORAL"
        mv -f "$TEMPORAL" "$NUEVO"

        echo "Renombrado: $ORIGINAL -> $NUEVO"
    fi
}

renombrar "img/Tarima_1.jpg" "img/tarima_1.jpg"
renombrar "img/Tarima_2.jpeg" "img/tarima_2.jpeg"
renombrar "img/Tarima_3.jpeg" "img/tarima_3.jpeg"
renombrar "img/Tarima_4.jpeg" "img/tarima_4.jpeg"

renombrar "img/estadistica_1.png" "img/estadistico_1.png"
renombrar "img/Estadistica_1.png" "img/estadistico_1.png"
renombrar "img/Estadistico_2.png" "img/estadistico_2.png"
renombrar "img/Estadistico_3.png" "img/estadistico_3.png"

if [ ! -f "img/tarima_2.jpeg" ]; then
    TARIMA_2="$(find "$SOURCE" -type f -iname "tarima_2.jpeg" -print -quit)"

    if [ -n "$TARIMA_2" ]; then
        cp "$TARIMA_2" "img/tarima_2.jpeg"
        echo "Copiada: img/tarima_2.jpeg"
    fi
fi

sed -i \
    -e 's#img/Tarima_1\.jpg#img/tarima_1.jpg#g' \
    -e 's#img/Tarima_2\.jpeg#img/tarima_2.jpeg#g' \
    -e 's#img/Tarima_3\.jpeg#img/tarima_3.jpeg#g' \
    -e 's#img/Tarima_4\.jpeg#img/tarima_4.jpeg#g' \
    -e 's#img/estadistica_1\.png#img/estadistico_1.png#g' \
    -e 's#docs/Proyecto_martin_salinas(1)\.pdf#docs/Proyecto_martin_salinas.pdf#g' \
    index.html

touch .nojekyll

echo
echo "Comprobando archivos usados por index.html..."

FALTANTES=0

while IFS= read -r ARCHIVO; do
    ARCHIVO="${ARCHIVO%%\?*}"
    ARCHIVO="${ARCHIVO%%\#*}"

    if [ -n "$ARCHIVO" ] && [ ! -e "$ARCHIVO" ]; then
        echo "FALTA: $ARCHIVO"
        FALTANTES=$((FALTANTES + 1))
    fi
done < <(
    grep -oE '(src|href)="[^"]+"' index.html |
    sed -E 's/^[^"]*"([^"]+)".*/\1/' |
    grep -E '^(img|docs|css|js|lib)/' |
    sort -u
)

if [ "$FALTANTES" -gt 0 ]; then
    echo
    echo "Se encontraron $FALTANTES archivos faltantes."
    echo "No se realizará el commit hasta corregirlos."
    exit 1
fi

echo "Todos los archivos referenciados existen."

git add -A

echo
echo "Cambios preparados:"
git status --short

if git diff --cached --quiet; then
    echo
    echo "No hay cambios nuevos para subir."
    exit 0
fi

git commit -m "Actualiza portafolio y corrige rutas de archivos"
git push origin main

echo
echo "Actualización subida correctamente."
git log -1 --oneline
