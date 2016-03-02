#!/bin/bash
############################################################################
#
# ACPICA Download and Build
# -------------------------------------------------
#
# Thanks to RehabMan for sitting there and destroying the issues with
# the unnamed Semaphore, without his Makefiles this wouldn't be possible.
#
############################################################################
$startdir=$PWD
regex='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
url="$1"
filename=${url##/*/}
ext=`echo "$filename" | cut -d'.' -f2`
if [[ $url =~ $regex ]]
then 
    echo "Downloading $filename ... [BEGIN]"
    curl $url > $filename
    if [[ $ext == "gz" ]]
    then
      tar xvf "$filename"
      tmpdir=`echo "$filename" | cut -d'.' -f1`
      cd $tmpdir
    else
      unzip "$filename"
      tmpdir=`echo "$filename | cut -d'.' -f1`
      cd $tmpdir
    fi
    unzip $startdir/resource.001
    mv Makefile ./generate/unix/Makefile
    mv Makefile.config ./generate/unix/Makefile
    make
    echo "Type \' make install \' if you would like to install this application."
else
    echo "This is not a valid URL for a download location."
fi
