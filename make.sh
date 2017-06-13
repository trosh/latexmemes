#!/bin/sh

mklatex () {
    dir=${1%/*}
    tex=${1##*/}
    out=${tex%.*}.png
    pushd "$dir"
    update=0
    for file in *.*
    do
        if test "$file" != "$out" -a "$file" -nt "$out"
        then
            pdflatex -shell-escape "$tex"
            rm -f *.{aux,log,dvi,pdf,ps}
            break
        fi
    done
    popd
}

for texfile in */*.tex
do
    mklatex $texfile
done
