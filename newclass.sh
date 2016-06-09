#!/bin/bash

if [ -z "$1" ] ; then
    echo "No classname given!"
    exit
fi

classname=$1;
cppfile=./src/"$classname".cpp
hfile=./include/"$classname".h

# cpp file
echo "public class $classname {" > $cppfile
echo "" >> $cppfile
echo "}" >> $cppfile

# h file
echo "public class $classname {" > $hfile
echo "" >> $hfile
echo "}" >> $hfile

