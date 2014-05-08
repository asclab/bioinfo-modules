#!/bin/sh
if [ ! -e .git ]; then
    echo "Run me from the root application directory"
    exit 1
fi

PROG=samtools
VERSION=0.1.19

CWD=$(pwd)
cd $(dirname $0)

if [ -e build ]; then
    echo "$PROG-$VERSION/build already exists!"
    exit 1
fi

echo "Building $PROG-$VERSION"

mkdir build
mkdir bin
mkdir -p man/man1

cd build
curl -OL http://downloads.sourceforge.net/project/samtools/samtools/$VERSION/samtools-$VERSION.tar.bz2
tar xf samtools-$VERSION.tar.bz2
cd samtools-$VERSION
make &> ../build.log
if [ $? != 0 ]; then
    echo "ERROR building $PROG-$VERSION!!!!"
    echo "See build.log for more details"
    exit 1
fi
cd ../..

find build -perm /u+x -not -type d -exec cp \{\} bin \;
find build -name '*.1' -exec cp \{\} man/man1 \;

cd $CWD
mkdir -p modulefiles/$PROG
cat <<EOF > modulefiles/$PROG/$VERSION
#%Module1.0#####################################################################
#
## $PROG-$VERSION
##
proc ModulesHelp { } {
    global version

    puts stderr "\tsamtools SAM/BAM file utilities"
    puts stderr "\n\tVersion \$version\n"
}

module-whatis "
samtools is a set of tools for working with SAM/BAM files
"

conflict $PROG

# for Tcl script use only
set version "$VERSION"

prepend-path PATH $MODAPPSDIR/$PROG/$PROG-$VERSION/bin
prepend-path MANPATH $MODAPPSDIR/$PROG/$PROG-$VERSION/man

if [ module-info mode load ] {
        puts stderr "$PROG version \$version loaded."
}

if [ module-info mode switch2 ] {
        puts stderr "$PROG version \$version loaded."
}

if [ module-info mode remove ] {
        puts stderr "$PROG version \$version unloaded."
}
EOF
