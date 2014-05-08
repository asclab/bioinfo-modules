#!./basesetup.sh

PROG=samtools
VERSION=0.1.19
SHORT="samtools SAM/BAM file utilities"
DESCRIPTION="samtools is a set of tools for working with SAM/BAM files"

build(){
echo "Downloading"
curl -sOL http://downloads.sourceforge.net/project/samtools/samtools/$VERSION/samtools-$VERSION.tar.bz2
tar xf samtools-$VERSION.tar.bz2
cd samtools-$VERSION
echo "Compiling"
make > ../build.log 2>&1
if [ $? != 0 ]; then
    echo "ERROR building $PROG-$VERSION!!!!"
    echo "See build.log for more details"
    exit 1
fi
cd ..
}
