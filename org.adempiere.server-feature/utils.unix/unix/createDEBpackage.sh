#!/bin/sh

## before running this command you must move and rename the folder as:
# mkdir -p ../../../idempiere.gtk.linux.x86_64
# mv ../../../linux/gtk/x86_64  ../../../idempiere.gtk.linux.x86_64/idempiere-server
# cd ../../../idempiere.gtk.linux.x86_64/idempiere-server/utils/unix
# bash createDEBpackage.sh

TMP=/tmp
cd "$(dirname "$0")"/../../.. || exit
SLEEKTIV_HOME=$(pwd)
RWD=$SLEEKTIV_HOME/idempiere-server/utils/unix
PACKAGE=$(ls -d "$SLEEKTIV_HOME")
PACKAGE=$(basename "$PACKAGE")
# VERSION=dev
# TIMESTAMP=$(date +%Y%m%d)
# PACKFILE=$SLEEKTIV_HOME/../${PACKAGE}_${VERSION}_${TIMESTAMP}.deb
PACKFILE=$SLEEKTIV_HOME/../${PACKAGE}.deb
find "$RWD"/../.. -name "*.sh" -exec chmod +x {} \;
chmod +x "$RWD"/DebianInstaller/etc/init.d/idempiere
rm -f $TMP/debian-binary $TMP/control.tar.gz $TMP/data.tar.gz $TMP/control.tar $TMP/data.tar "$PACKFILE"
echo 2.0 > $TMP/debian-binary
tar cvf $TMP/control.tar -C "$RWD"/DebianInstaller/DEBIAN .
gzip -v -9 $TMP/control.tar
tar cvf $TMP/data.tar -C "$RWD"/DebianInstaller/ ./usr
tar rvf $TMP/data.tar --exclude='idempiere.gtk.linux.x86_64/idempiere-server/utils/unix/createDEBpackage.sh' --exclude='idempiere.gtk.linux.x86_64/idempiere-server/utils/unix/DebianInstaller' --transform 's:^idempiere.gtk.linux.x86_64/idempiere-server:./opt/idempiere-server:' -C "$RWD"/../../../.. "$PACKAGE" > /dev/null
tar rvf $TMP/data.tar -C "$RWD"/DebianInstaller/ ./etc
gzip -v -9 $TMP/data.tar
cd $TMP || exit
ar q "$PACKFILE" debian-binary control.tar.gz data.tar.gz
rm debian-binary control.tar.gz data.tar.gz
echo "Created $PACKFILE"
