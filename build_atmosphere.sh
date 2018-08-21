#!/bin/sh

#Build script for BananaSplitNX
#Simple build script to compile, clean and copy over to sd files.

mkdir build 
cd build
mkdir atmosphere
mkdir atmosphere/titles
mkdir atmosphere/titles/0100000000000036
mkdir atmosphere/titles/0100000000000036/exefs
mkdir atmosphere/titles/010000000000100D
mkdir atmosphere/titles/010000000000100D/exefs
mkdir atmosphere/exefs_patches
mkdir BananaSplitNX
mkdir switch
mkdir switch/tinfoil
mkdir switch/NX-Shell
mkdir switch/Checkpoint
mkdir tinfoil
mkdir tinfoil/nsp
mkdir ftpd
cp /mnt/d/Github/BananaSplitNX/hekate_ipl.ini /mnt/d/Github/BananaSplitNX/build/hekate_ipl.ini
cp /mnt/d/Github/BananaSplitNX/bootlogo.bmp /mnt/d/Github/BananaSplitNX/build/bootlogo.bmp
cp /mnt/d/Github/BananaSplitNX/NX-Shell/NX-Shell.nro /mnt/d/Github/BananaSplitNX/build/switch/NX-Shell/NX-Shell.nro
cd /mnt/d/Github/BananaSplitNX/hekate
make
cp /mnt/d/Github/BananaSplitNX/hekate/output/hekate.bin /mnt/d/Github/BananaSplitNX/build/BananaSplitNX.bin
make clean
cp /mnt/d/Github/BananaSplitNX/atmosphere.patch /mnt/d/Github/BananaSplitNX/Atmosphere/atmosphere.patch
cd /mnt/d/Github/BananaSplitNX/Atmosphere
patch -p1 --binary < atmosphere.patch
rm atmosphere.patch
make
cp /mnt/d/Github/BananaSplitNX/Atmosphere/stratosphere/creport/creport.nso /mnt/d/Github/BananaSplitNX/build/atmosphere/titles/0100000000000036/exefs/main
cp /mnt/d/Github/BananaSplitNX/Atmosphere/stratosphere/creport/creport.npdm /mnt/d/Github/BananaSplitNX/build/atmosphere/titles/0100000000000036/exefs/main.npdm
cp /mnt/d/Github/BananaSplitNX/Atmosphere/stratosphere/loader/loader.kip /mnt/d/Github/BananaSplitNX/build/BananaSplitNX/loader.kip
cp /mnt/d/Github/BananaSplitNX/Atmosphere/stratosphere/fs_mitm/fs_mitm.kip /mnt/d/Github/BananaSplitNX/build/BananaSplitNX/fs_mitm.kip
cp /mnt/d/Github/BananaSplitNX/Atmosphere/stratosphere/pm/pm.kip /mnt/d/Github/BananaSplitNX/build/BananaSplitNX/pm.kip
cp /mnt/d/Github/BananaSplitNX/Atmosphere/stratosphere/sm/sm.kip /mnt/d/Github/BananaSplitNX/build/BananaSplitNX/sm.kip
cp -r "/mnt/d/Github/BananaSplitNX/Fake Tickets" /mnt/d/Github/BananaSplitNX/build/atmosphere/exefs_patches
make clean
cd /mnt/d/Github/BananaSplitNX/sys-ftpd
make
cp /mnt/d/Github/BananaSplitNX/sys-ftpd/sys-ftpd.kip /mnt/d/Github/BananaSplitNX/build/BananaSplitNX/sys_ftpd.kip
cp /mnt/d/Github/BananaSplitNX/sys-ftpd/sd_card/ftpd/* /mnt/d/Github/BananaSplitNX/build/ftpd/
make clean
cd /mnt/d/Github/BananaSplitNX/nx-hbmenu
make nx
cp /mnt/d/Github/BananaSplitNX/nx-hbmenu/nx-hbmenu.nro /mnt/d/Github/BananaSplitNX/build/hbmenu.nro
make clean
cd /mnt/d/Github/BananaSplitNX/nx-hbloader
make
cp /mnt/d/Github/BananaSplitNX/nx-hbloader/hbl.nso /mnt/d/Github/BananaSplitNX/build/atmosphere/titles/010000000000100D/exefs/main
cp /mnt/d/Github/BananaSplitNX/nx-hbloader/hbl.npdm /mnt/d/Github/BananaSplitNX/build/atmosphere/titles/010000000000100D/exefs/main.npdm
touch /mnt/d/Github/BananaSplitNX/build/atmosphere/titles/010000000000100D/exefs/rtld.stub
make clean
cd /mnt/d/Github/BananaSplitNX/Tinfoil
make
cp /mnt/d/Github/BananaSplitNX/Tinfoil/Tinfoil.nro /mnt/d/Github/BananaSplitNX/build/switch/tinfoil/tinfoil.nro
make clean
cd /mnt/d/Github/BananaSplitNX/Checkpoint
make
cp /mnt/d/Github/BananaSplitNX/Checkpoint/switch/out/Checkpoint.nro /mnt/d/Github/BananaSplitNX/build/switch/Checkpoint/Checkpoint.nro
make clean
cd /mnt/d/Github/BananaSplitNX/build
export DATE=$(date +%s | cut -c 1-8)
zip -r9 BananaSplitNX-$DATE.zip .
cp /mnt/d/Github/BananaSplitNX/build/BananaSplitNX-$DATE.zip /mnt/d/Github/BananaSplitNX/out/BananaSplitNX-$DATE.zip
cd /mnt/d/Github/BananaSplitNX
rm -r build