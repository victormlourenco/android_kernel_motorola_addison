if [ $# -gt 0 ]; then
echo $1 > .version
fi
 
make ARCH=arm CROSS_COMPILE=/home/victor/TC/arm-linux-androideabi-4.9/bin/arm-linux-androideabi- KBUILD_BUILD_USER= KBUILD_BUILD_HOST= KCFLAGS=-mno-android -j6
 
cp arch/arm/boot/zImage ~/anykernel_addison/
 
cd ~/anykernel_addison/
 
zipfile="RedKernel-rXXX-addison.zip"
echo "making zip file"
cp zImage zip/tmp/anykernel/
 
cd zip/
rm -f *.zip
zip -r $zipfile *
rm -f /kernel/*.zip
cp *.zip /tmp
