#!/bin/bash

path="./Lectures-lyx"
dest="./Lectures-pdf"
ext="pdf"
files=`ls $path | grep -v \~ | cut -d"." -f1 | uniq`
for f in $files
do
    lyx --export $ext $path/$f.lyx
    mv -f $path/$f.$ext $dest/
done
