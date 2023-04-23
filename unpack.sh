#!/system/bin/sh

make=/data/local/vendor_make

if [ -f /data/data/com.termux/files/usr/bin/python ]; then
py=/data/data/com.termux/files/usr/bin/python
else
py=/data/local/python39/usr/bin/python3
fi
chmod -R 755 $make
rm -rf $make/editor
mkdir -p $make/editor
rm -rf $make/update
mkdir -p $make/update

if [ -f $make/base/base*.img ]; then
mv $make/base/base*.img $make/base/vendor.img
fi

if [ -f $make/make/make*.img ]; then
mv $make/make/make*.img $make/make/make.img
fi

if [ -f $make/prebuilt/prebuilt*.img ]; then
mv $make/prebuilt/prebuilt*.img $make/prebuilt/prebuilt.img
fi

if [ -f $make/addon/addon*.img ]; then
mv $make/addon/addon*.img $make/addon/addon.img
fi

if [ -f $make/patch/patch*.img ]; then
mv $make/patch/patch*.img $make/patch/patch.img
fi

if [ -f $make/addon_update/addon*.img ]; then
mv $make/addon_update/addon*.img $make/addon_update/addon.img
fi

if [ -f $make/patch_update/patch*.img ]; then
mv $make/patch_update/patch*.img $make/patch_update/patch.img
fi

if [ -f $make/base/vendor.img ]; then
$py $make/imgextractor.py $make/base/vendor.img $make/editor
fi

if [ -f $make/make/make.img ]; then
$py $make/imgextractor.py $make/make/make.img $make/editor
fi

if [ -f $make/prebuilt/prebuilt.img ]; then
$py $make/imgextractor.py $make/prebuilt/prebuilt.img $make/editor
fi

if [ -f $make/addon/addon.img ]; then
$py $make/imgextractor.py $make/addon/addon.img $make/editor
fi

if [ -f $make/patch/patch.img ]; then
$py $make/imgextractor.py $make/patch/patch.img $make/editor
fi

if [ -f $make/addon_update/addon.img ]; then
$py $make/imgextractor.py $make/addon_update/addon.img $make/update
fi

if [ -f $make/patch_update/patch.img ]; then
$py $make/imgextractor.py $make/patch_update/patch.img $make/update
fi