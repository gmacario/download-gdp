#!/bin/bash
# See https://at.projects.genivi.org/wiki/display/GDP/GDP+Download+Page

# set -x
set -e

REMOTEDIR=http://docs.projects.genivi.org/gdp_files/v11
FILELIST=md5sum-gdp-11beta.txt

while IFS='' read -r line || [[ -n "$line" ]]; do
    # echo DEBUG: line=$line
    [[ $line = \#* ]] && continue
    f=$(echo $line | cut -d' ' -f2)
    # echo DEBUG: f=$f
    if [ -e $f ]; then
        echo "INFO: File $f exists - skipping"
    else
        echo "INFO: Fetching $f from ${REMOTEDIR}"
        wget ${REMOTEDIR}/$f
    fi
done < ${FILELIST}

echo "INFO: Verifying MD5SUMs in ${FILELIST}"
md5sum -c ${FILELIST}

echo "INFO: Listing downloaded files"
fl=""
while IFS='' read -r line || [[ -n "$line" ]]; do
    # echo DEBUG: line=$line
    [[ $line = \#* ]] && continue
    f=$(echo $line | cut -d' ' -f2)
    fl="${fl} ${f}"
done < ${FILELIST}
ls -l $fl

# EOF
