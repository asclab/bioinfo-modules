#!./basesetup.sh

PROG=STAR
VERSION=2.3.0e
SHORT="STAR RNA spliced aligner"
DESCRIPTION="Spliced transcript alignment to a reference"

build(){
echo "Downloading"
curl -sOL https://rna-star.googlecode.com/files/STAR_2.3.0e.tgz
tar xf STAR_2.3.0e.tgz 
cd STAR_2.3.0e
echo "Compiling"
make > ../build.log 2>&1
if [ $? != 0 ]; then
    echo "ERROR building $PROG-$VERSION!!!!"
    echo "See build.log for more details"
    exit 1
fi
cd ..
}
