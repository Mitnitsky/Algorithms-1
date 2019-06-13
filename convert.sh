#!/bin/bash

path="./Lectures-lyx"
dest="./Lectures-pdf"
format="pdf4"
ext="pdf"

lecfiles=`ls $path | grep -v \~ | grep -v ^[1-9] | grep algo | cut -d"." -f1 | uniq | sort -V`

make_lectures() {
    for f in $lecfiles
    do
        lyx -e $format $path/$f.lyx
        mv -f $path/$f.$ext $dest/
    done
    lyx -e pdf2 $path/algo10.lyx
    mv -f $path/algo10.$ext $dest/
    lyx -e pdf2 $path/algo11.lyx
    mv -f $path/algo11.$ext $dest/
}

make_merged_lectures() {
    sources=`ls $dest | grep algo | sort -V`
    ls $dest
    args=`echo $sources Lectures.pdf`
    cd $dest
    pdfunite $args
    cd ..
}

make_lectures
make_merged_lectures
