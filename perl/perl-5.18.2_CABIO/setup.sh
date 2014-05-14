#!./basesetup.sh

PROG=perl
VERSION=5.18.2_CABIO
SHORT="perl"
DESCRIPTION="Perl programming language with CABIO-specific libraries"
AUTOCOPY="0"

build(){
echo "Downloading"
curl -sOL http://www.cpan.org/src/5.0/perl-5.18.2.tar.gz
tar xf perl-5.18.2.tar.gz
cd perl-5.18.2
echo "Configuring"
./Configure -des -Dprefix=$MODAPPSDIR/perl/perl-$VERSION >> ../build.log 2>&1
echo "Compiling"
make >> ../build.log 2>&1
echo "Testing"
make test >> ../build.log 2>&1
echo "Installing"
make install >> ../build.log 2>&1
if [ $? != 0 ]; then
    echo "ERROR building $PROG-$VERSION!!!!"
    echo "See build.log for more details"
    exit 1
fi
cd ../..
echo "Installing modules..."
sed -e "s#\$\$PERLHOME#$(echo $MODAPPSDIR/perl/perl-$VERSION | sed -e 's#\/#\\\/#g')#g" MyConfig-templ.pm > build/MyConfig.pm
#sed -e "s#\$\$PERLHOME\$\$#$MODAPPSDIR/perl/perl-$VERSION#" MyConfig-templ.pm > build/MyConfig.pm
grep -v '^#' modules-list | while read line; do
echo "$line"
bin/cpan -j build/MyConfig.pm "$line"  >> build/build.log 2>&1
done
cd build
}
