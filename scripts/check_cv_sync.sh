#!/usr/bin/env bash
set -euo pipefail

spanish_files=(cv/summary.tex cv/education.tex cv/experience.tex cv/proyectos.tex cv/rrhh.tex cv/becas2.tex cv/skills.tex cv/biblio.tex)
english_files=(CV_JSPS_English/cv/summary.tex CV_JSPS_English/cv/education.tex CV_JSPS_English/cv/experience.tex CV_JSPS_English/cv/proyectos.tex CV_JSPS_English/cv/rrhh.tex CV_JSPS_English/cv/becas2.tex CV_JSPS_English/cv/skills.tex CV_JSPS_English/cv/biblio.tex)

spanish_sections=$(grep -h '^[[:space:]]*\\cvsection{' "${spanish_files[@]}" | wc -l | tr -d ' ')
english_sections=$(grep -h '^[[:space:]]*\\cvsection{' "${english_files[@]}" | wc -l | tr -d ' ')

if [ "$spanish_sections" != "$english_sections" ]; then
  echo "Spanish and English CVs have different section counts: ES=$spanish_sections EN=$english_sections" >&2
  exit 1
fi

spanish_entries=$(grep -h '^[[:space:]]*\\cventry' "${spanish_files[@]}" | wc -l | tr -d ' ')
english_entries=$(grep -h '^[[:space:]]*\\cventry' "${english_files[@]}" | wc -l | tr -d ' ')

if [ "$spanish_entries" != "$english_entries" ]; then
  echo "Spanish and English CVs have different cventry counts: ES=$spanish_entries EN=$english_entries" >&2
  exit 1
fi

spanish_honors=$(grep -h '^[[:space:]]*\\cvhonor' "${spanish_files[@]}" | wc -l | tr -d ' ')
english_honors=$(grep -h '^[[:space:]]*\\cvhonor' "${english_files[@]}" | wc -l | tr -d ' ')

if [ "$spanish_honors" != "$english_honors" ]; then
  echo "Spanish and English CVs have different cvhonor counts: ES=$spanish_honors EN=$english_honors" >&2
  exit 1
fi

article_count=$(grep -c '^@article{' bibliography.bib)
spanish_metric=$(grep -m1 -B1 'Artículos con referato' index.qmd | grep -Eo '[0-9]+' | head -n1)
english_metric=$(grep -m1 -B1 'Peer-reviewed articles' en/index.qmd | grep -Eo '[0-9]+' | head -n1)
spanish_web_pubs=$(grep -Ec '^[0-9]+\. ' index.qmd)
english_web_pubs=$(grep -Ec '^[0-9]+\. ' en/index.qmd)

if [ "$article_count" != "$spanish_metric" ] || [ "$article_count" != "$english_metric" ]; then
  echo "Publication metrics do not match bibliography articles: bib=$article_count ES=$spanish_metric EN=$english_metric" >&2
  exit 1
fi

if [ "$article_count" != "$spanish_web_pubs" ] || [ "$article_count" != "$english_web_pubs" ]; then
  echo "Web publication lists do not match bibliography articles: bib=$article_count ES=$spanish_web_pubs EN=$english_web_pubs" >&2
  exit 1
fi

echo "CV sync checks passed: $article_count publications, $spanish_sections mirrored sections, $spanish_entries mirrored entries, $spanish_honors mirrored honors."
