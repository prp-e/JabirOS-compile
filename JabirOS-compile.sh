#!/bin/sh
##########################
# JabirOS compile script #
# Author : M.Haghiri     #
# Special Thanks :       #
# ArchBSD Project        #
##########################
#  License : BSD         #
##########################
case $1 in
build)
 mkdir -v /tmp/JabirOS-Install
 export DESTDIR=/tmp/JabirOS-Install
 export VER=1
 export TARGET=amd64
 echo "JabirOS Install Script"
 sleep 5
 cd /usr/src
 make -j5 TARGET=$TARGET WERROR= buildworld buildkernel  || echo "Building Failed"
 sleep 5
 make -j1 DESTDIR="$DESTDIR" TARGET=$TARGET WERROR=  installkernel  || echo "Install kernel Failed"
 sleep 5
 make -j1 DESTDIR="$DESTDIR" -DWITHOUT_GCC  -DWITHOUT_LIB32 TARGET=$TARGET WERROR=  installworld distribution  || echo "Install  World and make distribution failed"
 sleep 5
 echo "JabirOS is installed on /tmp/JabirOS-Install"
;;
chroot)
    chroot $DESTIR /bin/sh
iso)
   export $VFS="cd9660:/dev/iso9660/JABIR_LIVE"
   export $FSTAB="/dev/iso9660/JABIR_LIVE  / ro 0 0"
   echo  "vfs.root.mountfrom=\"$VFS" > $DESTDIR/boot/loader.conf
   echo $FSTAB > $DESTDIR/etc/fstab
   echo "loader.conf was created successful!"
   sleep 5
   mkisofs -V JABIR_LIVE -b boot/cdboot -no-emul-boot -R -o $HOME/$USER/JabirOS-$VER-STABLE.iso $DESTDIR

;;
esac
