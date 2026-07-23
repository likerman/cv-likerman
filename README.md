# CV académico bilingüe — Jeremías Likerman

Repositorio fuente del curriculum vitae académico de Jeremías Likerman.

## Versiones

- CV completo en español: `Likerman_ES_2026.pdf`
- Full CV in English: `CV_JSPS_English/Jeremias_Likerman_CV_JSPS.pdf`
- Sitio web bilingüe en Quarto: `index.qmd` y `en/index.qmd`

## Publicación web

El sitio se compila y publica automáticamente después de cada cambio incorporado a `main`.

Para activarlo por primera vez:

1. Abrir **Settings → Pages**.
2. En **Build and deployment → Source**, seleccionar **GitHub Actions**.
3. Ejecutar **Publish bilingual CV**, o incorporar un nuevo cambio a `main`.

Dirección prevista: <https://likerman.github.io/cv-likerman/>

## Edición

- Página española: `index.qmd`
- English page: `en/index.qmd`
- Configuración: `_quarto.yml`
- Estilos: `styles.css`
- CV español en LaTeX: `cv.tex` y `cv/`
- CV inglés en LaTeX: `CV_JSPS_English/`
- Bibliografía compartida: `bibliography.bib`

Para previsualizar el sitio localmente:

```bash
quarto preview
```

Para generar los archivos estáticos:

```bash
quarto render
```
