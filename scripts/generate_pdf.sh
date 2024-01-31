#!/bin/bash

SCRIPTS_DIR="$(dirname $(readlink -e "$0"))"

$SCRIPTS_DIR/preparation.py

cd $SCRIPTS_DIR/..

pandoc -B scripts/titul.md scripts/toc.md -V colorlinks --css=scripts/style.css [^Rt]*.md -o $(pwd)/natch_docs.pdf \
        --pdf-engine=weasyprint \
        --metadata pagetitle="Natch documentation" \
        --metadata lang="Ru" \
#       --verbose > gen.html \
#       -N

if [[ -d .git ]]; then
       git reset --hard > /dev/null
fi
