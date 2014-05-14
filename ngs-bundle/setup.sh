#!./basesetup.sh
PROG=ngs-bundle
VERSION=0.1
SHORT="Bundle of NGS related tools"
DESCRIPTION="A group of NGS related tools that can be loaded as a bundle"
AUTOCOPY="0"
CUSTOM_MODFILE="1"

build() {
echo -n ""
}
custom_modfile(){

cat <<EOF > modulefiles/$PROG/$VERSION
#%Module1.0#####################################################################
#
## $PROG-$VERSION
##
proc ModulesHelp { } {
    global version

    puts stderr "\t$SHORT"
    puts stderr "\n\tVersion \$version\n"
}

module-whatis "
$DESCRIPTION
"

conflict $PROG

# for Tcl script use only
set version "$VERSION"
$MODFILEEXTRA
module add fastqc
module add bwa
module add circos
module add STAR
module add samtools
module add tabix

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
}
