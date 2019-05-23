#!/bin/bash

path="./Lectures-lyx"
dest="./Lectures-pdf"
format="pdf4"
ext="pdf"
files=`ls $path | grep -v \~ | grep -v ^[1-9] | cut -d"." -f1 | uniq`
for f in $files
do
    if [ -f  $f ]; then
        lyx -e $format $path/$f.lyx
        mv -f $path/$f.$ext $dest/
    fi
done
