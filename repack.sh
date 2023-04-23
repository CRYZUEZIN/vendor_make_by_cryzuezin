#!/system/bin/sh

make=/data/local/vendor_make

cp -frp $make/config $make/editor

if [ -d $make/editor/make ]; then
cp -frp $make/editor/make/* $make/editor/vendor
fi

if [ -d $make/editor/prebuilt ]; then
cp -frp $make/editor/prebuilt/* $make/editor/vendor
fi

if [ -d $make/editor/addon ]; then
cp -frp $make/editor/addon/* $make/editor/vendor
fi

if [ -d $make/editor/patch ]; then
cp -frp $make/editor/patch/* $make/editor/vendor
fi

if [ -d $make/update/addon ]; then
cp -frp $make/update/addon/* $make/editor/vendor
fi

if [ -d $make/update/patch ]; then
cp -frp $make/update/patch/* $make/editor/vendor
fi

if [ -f $make/debloat/*.sh ]; then
mv $make/debloat/*.sh $make/debloat/debloat.sh
fi

if [ -d $make/editor/vendor ]; then
cd $make/editor/vendor && sh $make/debloat/debloat.sh
fi

space=`cat $make/config/vendor/vendor_size.txt`
$make/make_ext4fs -J -T -1 -S $make/editor/config/vendor/vendor_file_contexts -C $make/editor/config/vendor/vendor_fs_config -l $space -a vendor /sdcard/vendor_new.img $make/editor/vendor