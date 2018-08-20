#!/bin/sh

#Build script for PatNX
#Simple build script to compile, clean and copy over to sd files.

mkdir build && cd build
mkdir atmosphere
mkdir atmosphere/titles
mkdir atmosphere/titles/0100000000000036
mkdir atmosphere/titles/0100000000000036/exefs
mkdir atmosphere/titles/010000000000100D
mkdir atmosphere/titles/010000000000100D/exefs
mkdir atmosphere/exefs_patches
mkdir PatNX
mkdir switch
mkdir ftpd
cd /mnt/d/Github/PatNX/hekate
make
cp /mnt/d/Github/PatNX/hekate/output/hekate.bin /mnt/d/Github/PatNX/PatNX.bin
make clean
cp /mnt/d/Github/PatNX/atmosphere.patch /mnt/d/Github/PatNX/Atmosphere/atmosphere.patch
patch -p1 --binary < atmosphere.patch
rm atmosphere.patch
make
cp /mnt/d/Github/PatNX/Atmosphere/stratosphere/creport/creport.nso /mnt/d/Github/PatNX/build/atmosphere/titles/0100000000000036/exefs/main
cp /mnt/d/Github/PatNX/Atmosphere/stratosphere/creport/creport.npdm /mnt/d/Github/PatNX/build/atmosphere/titles/0100000000000036/exefs/main.npdm
cp /mnt/d/Github/PatNX/Atmosphere/stratosphere/loader/loader.kip /mnt/d/Github/PatNX/build/PatNX/loader.kip
cp /mnt/d/Github/PatNX/Atmosphere/stratosphere/fs_mitm/fs_mitm.kip /mnt/d/Github/PatNX/build/PatNX/fs_mitm.kip
cp /mnt/d/Github/PatNX/Atmosphere/stratosphere/pm/pm.kip /mnt/d/Github/PatNX/build/PatNX/pm.kip
cp /mnt/d/Github/PatNX/Atmosphere/stratosphere/sm/sm.kip /mnt/d/Github/PatNX/build/PatNX/sm.kip
make clean
cd /mnt/d/Github/PatNX/sys-ftpd
make
cp /mnt/d/Github/PatNX/sys-ftpd/sys-ftpd.kip /mnt/d/Github/PatNX/build/PatNX/sys_ftpd.kip
cp /mnt/d/Github/PatNX/sys-ftpd/sd_card/ftpd/* /mnt/d/Github/PatNX/build/ftpd/
make clean
cd /mnt/d/Github/PatNX/nx-hbmenu
make nx
cp /mnt/d/Github/PatNX/nx-hbmenu/nx-hbmenu.nro /mnt/d/Github/PatNX/build/hbmenu.nro
make clean
cd /mnt/d/Github/PatNX/nx-hbloader
make
cp /mnt/d/Github/PatNX/nx-hbloader/hbl.nso /mnt/d/Github/PatNX/build/atmosphere/titles/010000000000100D/exefs/main
cp /mnt/d/Github/PatNX/nx-hbloader/hbl.npdm /mnt/d/Github/PatNX/build/atmosphere/titles/010000000000100D/exefs/main.npdm
touch /mnt/d/Github/PatNX/build/atmosphere/titles/010000000000100D/exefs/rtld.stub
make clean
cd /mnt/d/Github/PatNX/Tinfoil
make
cp /mnt/d/Github/PatNX/Tinfoil/Tinfoil.nro /mnt/d/Github/PatNX/build/switch/tinfoil/tinfoil.nro
make clean
cp -r "/mnt/d/Github/PatNX/Fake Tickets" /mnt/d/Github/PatNX/build/atmosphere/exefs_patches
cd /mnt/d/Github/PatNX/Checkpoint
make
cp /mnt/d/Github/PatNX/NX-Shell/NX-Shell.nro /mnt/d/Github/PatNX/build/switch/NX-Shell/NX-Shell.nro
cp /mnt/d/Github/PatNX/Checkpoint/switch/out/Checkpoint.nro /mnt/d/Github/PatNX/build/switch/Checkpoint/Checkpoint.nro
make clean
cp /mnt/d/Github/PatNX/hekate_ipl.ini /mnt/d/Github/PatNX/build/hekate_ipl.ini
cp /mnt/d/Github/PatNX/bootlogo.bmp /mnt/d/Github/PatNX/build/bootlogo.bmp
cd /mnt/d/Github/PatNX/build
export DATE=$(date +%s | cut -c 1-8)
zip -r9 PatNX-$DATE.zip .
cp /mnt/d/Github/PatNX/build/PikaNX-$DATE.zip /mnt/d/Github/PatNX
cd /mnt/d/Github/PatNX
rm -r build