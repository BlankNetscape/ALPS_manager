#!/bin/bash
# path="$(cat ./boot.sh | grep '^path' | awk '{print substr($1,6);}' | awk -F '"' -v OFS="" '{$1=""; print}')"
path=$1
#
if [ -f "${path}/current" ]; then
  touch ${path}/current
fi
#
> ${path}/current
for file in ${path}/alp/*alp
do
  echo -e ". ${file}"  >> ${path}/current
done
