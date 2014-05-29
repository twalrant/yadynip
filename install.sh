#!/bin/bash
#
name=yadynip
installdir=/usr/local
test -n "$1" && installdir=$1
mkdir -p $installdir/bin || exit;
mkdir -p $installdir/etc/$name/checkip.d/conf || exit;
mkdir -p $installdir/etc/$name/actions.d/conf || exit;
mkdir -p $installdir/share/$name/ipcaches || exit;

cp bin/$name $installdir/bin || exit;
chmod 755 $installdir/bin/$name

cp etc/$name.conf $installdir/etc/$name.conf || exit;
chmod 644 $installdir/etc/$name.conf

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

echo Installation completed: $name
[ "$installdir" == "/usr/local" ] || exit;
cat <<EOF

You'll probably need root access to run the yadynip program. The cache
data is stored in read-only folder. See README for details.
EOF
