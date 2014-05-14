#!./basesetup.sh

PROG=R
VERSION=3.1.0_CABIO
SHORT="R"
DESCRIPTION="R statistical language with CABIO-specific libraries"
MODFILE_EXTRA="setenv RHOME $MODAPPSDIR/R/R-3.1.0_CABIO/lib64/R"

build(){
echo "Downloading"
curl -sOL http://cran.rstudio.com/src/base/R-3/R-3.1.0.tar.gz
tar xf R-3.1.0.tar.gz
cd R-3.1.0
echo "Configuring"
./configure --prefix=$MODAPPSDIR/R/R-3.1.0_CABIO >> ../build.log 2>&1
echo "Compiling"
make >> ../build.log 2>&1
echo "Installing"
make install >> ../build.log 2>&1
if [ $? != 0 ]; then
    echo "ERROR building $PROG-$VERSION!!!!"
    echo "See build.log for more details"
    exit 1
fi
cd ../..
echo "Installing modules..."
grep -v '^#' install-packages | while read line; do
echo "$line"
echo "install.packages('$line', repos='http://cran.cnr.Berkeley.edu')" | R --vanilla -q
done

echo 'source("http://bioconductor.org/biocLite.R");biocLite("edgeR")' | R --vanilla -q
cd build
}
