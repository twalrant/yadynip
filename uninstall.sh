#!/bin/bash
#
name=yadynip
installdir=/usr/local
logdir=/var/local/log

if [ -f /etc/$name-uninstall ]; then
    . /etc/$name-uninstall
fi
logfile=$logdir/$name.log

read -p "Removing $name from $installdir... [y/n/I]? " answer
case $answer in
    y*|Y*)
        option="-f";
        ;;
    i*|I*)
        option="-i";
        ;;
    *)
        exit;
        ;;
esac

rm $option $installdir/bin/$name
rm $option $installdir/etc/$name.conf
rm $option -r $installdir/etc/$name
rm $option -r $installdir/share/$name
rm $option /etc/$name-uninstall
rm $option $logfile

echo $name uninstalled.
