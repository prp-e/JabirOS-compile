#!/bin/sh
##########################
# JabirOS compile script #
# Author : M.Haghiri     #
# Special Thanks :       #
# Amzo, Blub\w , bkc_    #
##########################
#  License : BSD         #
##########################
 echo "JabirOS Install Script"
 sleep 5
 cd /usr/src
 make buildworld buildkernel || echo "Building Failed"
 sleep 5
 mkdir -v /tmp/JabirOS-Install
 export DESTDIR=/tmp/JabirOS-Install
 make -j1 DESTDIR="$DESTDIR" installkernel || echo "Install kernel Failed"
 sleep 5
 make -j1 DESTDIR="$DESTDIR" -DWITHOUT_GCC -DWITHOUT_BINUTILS -DWITHOUT_LIB32 -DWITHOUT_BSD_CPIO installworld distribution || echo "Install  World and make distribution failed"
 sleep 5
 echo "JabirOS is installed on /tmp/JabirOS-Install"

