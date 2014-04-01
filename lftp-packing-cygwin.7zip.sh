#!/bin/bash
if [ $# -eq 0 ]
  then
    echo "&lt;script> name"
    exit
fi

if [ ! -f lftp.exe ];
then
 echo "lftp.exe doesn't exist run this file from where it exists"
 exit
fi
cwd=`pwd`
items=`ldd.exe lftp.exe | grep --invert-match Windows | cut -d " " -f3`
tmpdir=`mktemp.exe --directory`
echo "Creating temporary directory $tmpdir"
mkdir $tmpdir/bin
mkdir $tmpdir/etc
for item in $items
do
 echo "Copying LFTP dependency file: $item to $tmpdir/bin"
 cp $item $tmpdir/bin
done
items=`ldd.exe /bin/ssh.exe | grep --invert-match Windows | cut -d " " -f3`
for item in $items
do
 echo "Copying SSH dependency file: $item"
 cp $item $tmpdir/bin
done
items=`ldd.exe /bin/bash.exe | grep --invert-match Windows | cut -d " " -f3`
for item in $items
do
 echo "Copying BASH dependency file: $item"
 cp $item $tmpdir/bin
done
echo "Copying required files"
cp lftp.exe $tmpdir/bin
cp ../lftp.conf $tmpdir/etc
cp /bin/ssh.exe $tmpdir/bin
cp /bin/bash.exe $tmpdir/bin
cd $tmpdir
/cygdrive/c/Program\ Files\ \(x86\)/7-Zip/7z.exe a ../$1.7z .
mv ../$1.7z /cygdrive/c/lftpbuilding/compiled
cd $cwd
echo "File generated: $1.7z"

