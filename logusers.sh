#!/bin/sh

# CÉSAR BORAO: logusers.sh

if test $# -ne 1
then
	echo usage: logusers [new directory] 1>&2
	exit 1
fi

userlog () {
	for line in $(who | awk '{ print $1 }')
	do
		touch $1/$line.log
		ps aux | grep $line | awk '{ print $2 }' > $1/$line.log
	done
}

if ! test -d $1
then
	mkdir $1
	userlog $1
	exit 0
fi

echo error: directory already exists 1>&2
exit 1
