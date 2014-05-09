#!./basesetup.sh

PROG=tabix
VERSION=0.2.6
SHORT="tabix indexed tab-delimited file utilities"
DESCRIPTION="tabix is a set of tools for working with and indexing tab-delimited text files"

build(){
echo "Downloading"
curl -sOL http://downloads.sourceforge.net/project/samtools/tabix/tabix-$VERSION.tar.bz2
tar xf tabix-$VERSION.tar.bz2
cd tabix-$VERSION
echo "Compiling"
make > ../build.log 2>&1
if [ $? != 0 ]; then
    echo "ERROR building $PROG-$VERSION!!!!"
    echo "See build.log for more details"
    exit 1
fi
cd ..
}
