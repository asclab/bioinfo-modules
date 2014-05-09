#!./basesetup.sh
PROG=circos
VERSION="0.66"
SHORT="circos - circular data visualization"
DESCRIPTION="Circos is a software package for visualizing data and information in a circular layout."
AUTOCOPY="0"

build() {
echo "Downloading"
curl -OL http://www.circos.ca/distribution/circos-0.66.tgz
tar xf circos-0.66.tgz
ln -s circos-0.66/bin/* ../bin
}

