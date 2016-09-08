#!/bin/bash
#

## Get run scripts or programs in a directory, do not execute.
## Similar to run-parts(8)
function runparts()
{
    local dir=$1;
    local regex='[A-Za-z0-9_\-]+$';
    local parts
    [ -n "$2" ] && regex=$2;
    for f in $(/usr/bin/find $dir -type f -regex $dir'/'$regex | sort); do
        [ -x "$f" ] || continue;	# Skip, if not executable.
        parts="$parts $f";
    done
    /bin/echo $parts;
}

name=yadynip
installdir=/usr/local
logdir=/var/local/log
test -n "$1" && installdir=$1 && logdir=$1
/bin/mkdir -p $logdir || exit;
/bin/mkdir -p $installdir/bin || exit;
/bin/mkdir -p $installdir/etc/$name/checkip.d || exit;
/bin/mkdir -p $installdir/etc/$name/actions.d || exit;
/bin/mkdir -p $installdir/share/$name/ipcaches || exit;

logfile=$logdir/$name.log
echo $(date -R) $name installed >> $logfile

/bin/cp bin/$name $installdir/bin || exit;
/bin/chmod 755 $installdir/bin/$name

/bin/cp -i etc/$name.conf $installdir/etc/$name.conf || exit;
/bin/chmod 640 $installdir/etc/$name.conf

for dir in checkip.d actions.d; do
    for part in $(runparts etc/$dir); do
        /bin/cp $part $installdir/etc/$name/$dir
        /bin/chmod 755 $installdir/etc/$name/$dir/$(basename $part)
        [ -f "$part.conf.tpl" ] || continue
        /bin/cp $part.conf.tpl $installdir/etc/$name/$dir
    done
    /bin/chmod 640 $installdir/etc/$name/$dir/*.tpl
done

# Create a trace for later uninstall
/bin/echo installdir=$installdir > /etc/$name-uninstall
/bin/echo logdir=$logdir >> /etc/$name-uninstall

echo Installation completed: $name
[ "$installdir" == "/usr/local" ] && exit;
/bin/cat <<EOF

You'll probably need root access to run the yadynip program. The cache
data is stored in read-only folder. See README for details.
EOF
