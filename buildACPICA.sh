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

# if url variable isn't set, we can't continue so exit.
if [ -z $1 ] 
then 
   echo "required archive variable is not set."
   echo "usage: $0 <url>" && exit
fi

startdir=$PWD
regex='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'

url=$1
filename=`echo $url | rev | cut -d'/' -f1 | rev`
ext=`echo $filename | rev | cut -d'.' -f1 | rev`

echo $filename
echo $ext

if [[ $url =~ $regex ]]
then 

    echo 'Downloading `echo $filename` if required... [BEGIN]'

    if [[ ! -e $filename ]]
    then
	curl $url > $filename
    fi

    if [[ $ext == "gz" ]]
    then
      tar -xvf $filename && tmpdir=`echo "$filename" | cut -d'.' -f1` && cd $tmpdir/generate/unix\
      && unzip $startdir/resource.001 && $startdir
    fi

    if [[ $ext == "zip" ]]
    then
      unzip $filename && tmpdir=`echo $filename | cut -d'.' -f1` && cd $tmpdir/generate/unix\
      && unzip $startdir/resource.001 && cd $startdir
    fi

    make
    echo "Type make install if you would like to install this application."

else

    echo "This is not a valid URL for a download location."

fi
