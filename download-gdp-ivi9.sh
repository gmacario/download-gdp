#!/bin/bash
# See https://at.projects.genivi.org/wiki/x/64Kw

set -x
set -e

REMOTEDIR=http://docs.projects.genivi.org/gdp_files/v9/
FILELIST=md5sum-gdp-v9beta.txt

while read line < ${FILELIST}; do
    echo DEBUG: line=$line
    # TODO
    # if [ ! -e $f ]; then
    #    echo INFO: Fetching $f from ${REMOTEDIR}
    #    wget ${REMOTEDIR}/$f
    # f
done
md5sum -c ${FILELIST}

# EOF