#!/bin/bash
#
name=yadynip
installdir=/usr/local
test -n "$1" && installdir=$1
mkdir -p $installdir/bin
mkdir -p $installdir/etc/$name/checkip.d/conf
mkdir -p $installdir/etc/$name/actions.d/conf
mkdir -p $installdir/share/$name/ipcaches

cp $name $installdir/bin
chmod 755 $installdir/bin/$name

cp etc/$name.conf $installdir/etc/$name/$name.conf
chmod 644 $installdir/etc/$name/$name.conf

for f in etc/checkip.d/*; do
    [ -d $f ] && continue
    echo $f | grep -Pqe "~$" && continue
    cp $f $installdir/etc/$name/checkip.d
    chmod 755 $installdir/etc/$name/checkip.d/$(basename $f)
done
cp etc/checkip.d/conf/*.tpl $installdir/etc/$name/checkip.d/conf
chmod 644 $installdir/etc/$name/checkip.d/conf/*.tpl

for f in etc/actions.d/*; do
    [ -d $f ] && continue
    echo $f | grep -Pqe "~$" && continue
    cp $f $installdir/etc/$name/actions.d
    chmod 755 $installdir/etc/$name/actions.d/$(basename $f)
done
cp etc/actions.d/conf/*.tpl $installdir/etc/$name/actions.d/conf
chmod 644 $installdir/etc/$name/actions.d/conf/*.tpl
