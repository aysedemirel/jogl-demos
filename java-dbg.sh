#! /bin/sh

CPOK=0
echo $CLASSPATH | grep jogl && CPOK=1

if [ $CPOK -eq 0 ] ; then
    # Only valid for autobuild .. otherwise run manually with build-dir
    . ./setenv-jogl.sh JOGL_ALL
    echo $CLASSPATH | grep jogl && CPOK=1
fi
if [ $CPOK -eq 0 ] ; then
    echo No JOGL in CLASSPATH
else
    java -Dgluegen.debug.ProcAddressHelper=true -Dgluegen.debug.NativeLibrary=true -Dnativewindow.debug=all -Djogl.debug=all $* 2>&1 | tee java-dbg.log
    # java -Dnewt.debug=all -Dnativewindow.debug=all -Djogl.debug=all $* 2>&1 | tee java-dbg.log
    # java -Djogl.debug=all $* 2>&1 | tee java-dbg.log
fi

