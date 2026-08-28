# CV académico de Jeremías Likerman

Repositorio fuente del curriculum vitae académico de **Jeremías Likerman**.

## Contenidos

- `cv.tex` y `cv/`: CV completo en español, maquetado con Awesome-CV.
- `CV_JSPS_English/main.tex` y `CV_JSPS_English/cv/`: CV completo en inglés, con la misma estructura y maquetación que el español.
- `index.qmd`: página web en español.
- `en/index.qmd`: página web en inglés.
- `_quarto.yml`: configuración del sitio bilingüe.
- `.github/workflows/publish.yml`: publicación automática con GitHub Pages.

## Sitio web

La dirección prevista es:

`https://likerman.github.io/cv-likerman/`

Para habilitarla por primera vez, abrir **Settings → Pages** y seleccionar **GitHub Actions** como origen de publicación. El repositorio es privado; GitHub Pages para repositorios privados requiere un plan compatible. El sitio publicado será público aunque el repositorio permanezca privado.

## Desarrollo local

Instalar [Quarto](https://quarto.org/) y ejecutar:

```bash
quarto preview
```

Para generar el sitio estático:

```bash
quarto render
```

## Compilación de los CVs

Los CVs requieren XeLaTeX/LuaLaTeX, Biber y `latexmk`:

```bash
bash scripts/check_cv_sync.sh
latexmk -xelatex cv.tex
(cd CV_JSPS_English && latexmk -lualatex main.tex)
cp CV_JSPS_English/main.pdf CV_JSPS_English/Jeremias_Likerman_CV_JSPS.pdf
```

## Criterio de actualización

El CV español y el CV inglés deben mantenerse como versiones paralelas: mismo orden de secciones, misma cantidad de entradas, misma bibliografía y misma maquetación compartida desde `cv/layout.tex`. El archivo `bibliography.bib` es la fuente única para las publicaciones en PDF; al agregar o quitar un artículo, actualizar también los listados resumidos de `index.qmd` y `en/index.qmd`.

El workflow de GitHub ejecuta `scripts/check_cv_sync.sh` antes de compilar. Si se actualiza una versión y no la otra, la publicación de GitHub Pages falla en lugar de publicar CVs desalineados.

La web expone únicamente información profesional: no publica fecha de nacimiento ni teléfono personal.
