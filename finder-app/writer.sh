#!/bin/sh
# Tester script for assignment 1 and assignment 2
# Author: Siddhant Jajoo

set -e
set -u

WRITESTR="AELD_IS_FUN"
WRITEFILE=/tmp/aeld-data/garb

if [ $# -ne 2 ]
then

        echo "reenter in proper format -> ./writer.sh <write-file> <write string>"
        exit 1

else
	WRITEFILE=$1
	WRITESTR=$2
fi

FILE="${WRITEFILE##*/}"
WRITEPATH="${WRITEFILE%/*}"

mkdir -p $WRITEPATH

echo $WRITESTR > $WRITEFILE

if [ ! -d "$WRITEPATH" ]
then
        echo "error: path not created"
fi

if [ ! -f "$WRITEFILE" ]
then
        echo "error: file not created"
fi

