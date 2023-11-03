#!/bin/sh
# Tester script for assignment 1 and assignment 2
# Author: Siddhant Jajoo

set -e
set -u

SEARCHSTR="AELD_IS_FUN"
FILESDIR=/tmp/aeld-data

if [ $# -ne 2 ]
then

        echo "reenter in proper format -> ./finder.sh <files directory> <search string>"
        exit 1

else
	FILEDIR=$1
	SEARCHSTR=$2
fi

if [ -d "$FILESDIR" ]

then

        X=$(find $FILESDIR -type f -exec grep -l $SEARCHSTR "{}" ";" | wc -l)
        Y=$(find $FILESDIR -type f -exec grep $SEARCHSTR "{}" ";" | wc -l)
        echo "The number of files are $X and the number of matching lines are $Y"

else

        echo "missing director $FILESDIR"
        exit 1

fi
