#!/bin/sh
VERSION=0.1.19
mkdir -p build
mkdir -p bin
mkdir -p man/man1

cd build
curl -OL http://downloads.sourceforge.net/project/samtools/samtools/$VERSION/samtools-$VERSION.tar.bz2
curl -OL http://downloads.sourceforge.net/project/samtools/samtools-$VERSION.tar.bz2
tar xvf samtools-$VERSION.tar.bz2
cd samtools-$VERSION
make
cd ../..
find build -perm /u+x -not -type d -exec cp \{\} bin \;
find build -name '*.1' -exec cp \{\} man/man1 \;
