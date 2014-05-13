#!./basesetup.sh
PROG=circos
VERSION="0.66"
SHORT="circos - circular data visualization"
DESCRIPTION="Circos is a software package for visualizing data and information in a circular layout."
AUTOCOPY="0"
MODFILEEXTRA="module add perl/5.18.2_CABIO"
build() {
echo "Downloading"
curl -OL http://www.circos.ca/distribution/circos-0.66.tgz
tar xf circos-0.66.tgz
cd ../bin
ln -s ../build/circos-0.66/bin/circos .
cd ../build
}

