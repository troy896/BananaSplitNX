#!/bin/sh

#Build script for BananaSplitNX
#Simple build script to compile, clean and copy over to sd files.

mkdir build 
cd build
mkdir switch
mkdir switch/tinfoil
mkdir switch/NX-Shell
mkdir switch/Checkpoint
mkdir tinfoil
mkdir tinfoil/nsp
mkdir ftpd

cp /mnt/d/Github/BananaSplitNX/NX-Shell/NX-Shell.nro /mnt/d/Github/BananaSplitNX/build/switch/NX-Shell/NX-Shell.nro
cd /mnt/d/Github/BananaSplitNX/ReiNX
make
cp /mnt/d/Github/BananaSplitNX/ReiNX/out/ReiNX.bin /mnt/d/Github/BananaSplitNX/build/BananaSplitNX.bin
cp -r "/mnt/d/Github/BananaSplitNX/ReiNX/out/ReiNX" /mnt/d/Github/BananaSplitNX/build
cd /mnt/d/Github/BananaSplitNX/build/ReiNX
mkdir titles
mkdir titles/010000000000100D
mkdir titles/010000000000100D/exefs
cd /mnt/d/Github/BananaSplitNX/ReiNX
make clean
cd /mnt/d/Github/BananaSplitNX/sys-ftpd
make
cp /mnt/d/Github/BananaSplitNX/sys-ftpd/sys-ftpd.kip /mnt/d/Github/BananaSplitNX/build/ReiNX/sysmodules/sys_ftpd.kip
cp /mnt/d/Github/BananaSplitNX/sys-ftpd/sd_card/ftpd/* /mnt/d/Github/BananaSplitNX/build/ftpd/
make clean
cd /mnt/d/Github/BananaSplitNX/nx-hbmenu
make nx
cp /mnt/d/Github/BananaSplitNX/nx-hbmenu/nx-hbmenu.nro /mnt/d/Github/BananaSplitNX/build/hbmenu.nro
make clean
cd /mnt/d/Github/BananaSplitNX/nx-hbloader
make
cp /mnt/d/Github/BananaSplitNX/nx-hbloader/hbl.nso /mnt/d/Github/BananaSplitNX/build/ReiNX/titles/010000000000100D/exefs/main
cp /mnt/d/Github/BananaSplitNX/nx-hbloader/hbl.npdm /mnt/d/Github/BananaSplitNX/build/ReiNX/titles/010000000000100D/exefs/main.npdm
touch /mnt/d/Github/BananaSplitNX/build/ReiNX/titles/010000000000100D/exefs/rtld.stub
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