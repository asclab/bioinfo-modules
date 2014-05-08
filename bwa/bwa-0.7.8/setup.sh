#!./basesetup.sh
PROG=bwa
VERSION=0.7.8
SHORT="bwa sequence aligner"
DESCRIPTION="BWA is a NGS sequence aligner for NGS DNA samples"

build() {
echo "Downloading"
curl -sOL http://downloads.sourceforge.net/project/bio-bwa/bwa-$VERSION.tar.bz2
tar xf bwa-$VERSION.tar.bz2
cd bwa-$VERSION
echo -n "" > ../build.log
if [ -e ../../patch.$(uname) ]; then
    echo "Patching"
    patch -p1 < ../../patch.$(uname) > ../build.log 2>&1
fi
echo "Compiling"
make >> ../build.log 2>&1
if [ $? != 0 ]; then
    echo "ERROR building $PROG-$VERSION!!!!"
    echo "See build.log for more details"
    exit 1
fi
cd ..

}

