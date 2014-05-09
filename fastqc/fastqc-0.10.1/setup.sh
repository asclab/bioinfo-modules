#!./basesetup.sh
PROG=fastqc
VERSION=0.10.1
SHORT="FastQC quality control tool"
DESCRIPTION="A quality control application for high throughput sequence data"

build() {
echo "Downloading"
curl -sOL http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.10.1.zip
unzip fastqc_v$VERSION.zip
chmod +x FastQC/fastqc
mv FastQC/* ../bin

}

