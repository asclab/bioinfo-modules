#!/bin/sh
VERSION=0.7.8
mkdir build
mkdir bin
mkdir -p man/man1

cd build
curl -OL http://downloads.sourceforge.net/project/bio-bwa/bwa-$VERSION.tar.bz2
tar xvf bwa-$VERSION.tar.bz2
cd bwa-$VERSION
make
cd ../..
cp build/bwa-$VERSION/bwa bin
cp build/bwa-$VERSION/*.pl bin
cp build/bwa-$VERSION/bwa.1 man/man1
