# CV académico de Jeremías Likerman

Repositorio fuente del curriculum vitae académico de **Jeremías Likerman**.

## Contenidos

- `cv.tex` y `cv/`: CV completo en español, maquetado con Awesome-CV.
- `CV_JSPS_English/`: versión completa en inglés.
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

## Compilación del CV en español

El CV requiere XeLaTeX y Biber:

```bash
xelatex cv.tex
biber cv
xelatex cv.tex
xelatex cv.tex
```

## Criterio de actualización

El CV español y la página web se armonizaron con la versión inglesa más reciente. La web expone únicamente información profesional: no publica fecha de nacimiento ni teléfono personal.
