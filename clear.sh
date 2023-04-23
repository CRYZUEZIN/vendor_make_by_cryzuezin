#!/system/bin/sh

make=/data/local/vendor_make

clear
echo "- Cleaning.."
rm -rf $make/editor
rm -rf $make/update
find . -type f -name *.img -delete
rm -rf $make/debloat/debloat.sh
echo " "
echo "- Done!"