#!/bin/bash
# See https://at.projects.genivi.org/wiki/x/64Kw

# set -x
set -e

REMOTEDIR=http://docs.projects.genivi.org/gdp_files/v9/
FILELIST=md5sum-gdp-v9beta.txt

while IFS='' read -r line || [[ -n "$line" ]]; do
    # echo DEBUG: line=$line
    [[ $line = \#* ]] && continue
    f=$(echo $line | cut -d' ' -f2)
    echo DEBUG: f=$f
    if [ ! -e $f ]; then
        echo INFO: Fetching $f from ${REMOTEDIR}
        wget ${REMOTEDIR}/$f
    fi
done < ${FILELIST}
md5sum -c ${FILELIST}

# EOF
