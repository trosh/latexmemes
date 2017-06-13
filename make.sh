#!/bin/sh

mklatex () {
    dir=${1%/*}
    tex=${1##*/}
    pushd "$dir"
    pdflatex -shell-escape "$tex"
    rm -f *.{aux,log,dvi,pdf,ps}
    popd
}

for texfile in */*.tex
do
    mklatex $texfile
done
