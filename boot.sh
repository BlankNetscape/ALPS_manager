#!/bin/bash
# path="./" # local
path="/root/scripts/alps_manager" # global # !IMPORTANT
  # ^ path format - [path to alps_manager folder]
  # ^ (without "/" at the END)
# Editors [nano, vim]
editor="nano"
###
###
###
if [[ -e "${path}/alps_scaner.sh" ]]; then
  if [[ !(-e "${path}/alps.sh") ]]; then
    echo -e "alps.sh: Not found!"
    # exit
  fi
fi
# ^ Checks
. $path/alps_scanner.sh
# ^ Scan
for (( line=1; line<=$(cat ${path}/current | wc -l); line++))
do # execute Line(pkg's) times
packet=$(cat ${path}/current | sed -n ${line}'p' | awk '{print $2}') # grep packet without ". "
pkgStatus=$(cat ${packet} | grep "status" | awk '{print $2}') # grep 2nd word)
##
if [[ pkgStatus -eq 1 ]]; then
  . ${packet}
fi
##
done
printf "Gotcha! %d - alps checked.\n" "$(cat ${path}/current | wc -l)"
