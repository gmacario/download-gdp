#!/bin/bash
# See https://at.projects.genivi.org/wiki/x/64Kw

set -x
set -e

REMOTEDIR=http://docs.projects.genivi.org/gdp_files/v9/
FILE01=genivi-demo-platform-qemux86-64.rootfs.ext4.gz
FILE01_MDSUM=52c95b56fa4feb25e1022db94db9c931
FILE02=bzImage
FILE02_MD5SUM=eae4dadeb312083bee6b5fa0f0820b8f
FILE03=genivi-demo-platform-qemux86-64.rootfs.manifest
FILE03_MD5SUM=3d8ced8f700351b85491d961d85bf722
FILE04=license.manifest
FILE04_MD5SUM=d177c85e38587a5c99a58d16f5605e24
FILE05=licenses.tar.gz
FILE05_MD5SUM=4a2395ca47fcc49339ce76d6abc4d061
FILE06=oe-source.tar.gz
FILE06_MD5SUM=064f240e35c64e33ac51955c183d5660
FILE07=sources.tar.gz
FILE07_MD5SUM=01e0fa237714fa270ead187cf21598e0
#
for v in FILE01 FILE02 FILE03 FILE04 FILE05; do
    $f=${$v}
    echo DEBUG: v=$v; f=$f
    if [ ! -e $f ]; then
        echo INFO: Fetching $f from ${REMOTEDIR}
        wget ${REMOTEDIR}/$f
    fi
    md5sum -c $f
done

# EOF