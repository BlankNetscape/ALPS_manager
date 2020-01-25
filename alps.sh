#!/bin/bash
#path="$(cat ./boot.sh | grep '^path' | awk '{print substr($1,6);}' | awk -F '"' -v OFS="" '{$1=""; print}')"
# ^ grep ^path without (path=) and quotes
### Vars
  # Box
  boxCap="\e[38;5;60m╒════════╤═══════════╤════════════════╤════════════════╕\e[0m\n\e[38;5;60m│ \e[38;5;105malp ID \e[38;5;60m│ \e[38;5;105malp Name  \e[38;5;60m│ \e[38;5;105mAlias          \e[38;5;60m│ \e[38;5;105mContent        \e[38;5;60m│\e[0m\n\e[38;5;60m├────────┼───────────┼────────────────┼────────────────┤\e[0m\n";
  boxBlankHalf="\e[38;5;60m\n│        │\e[0m           "
  #
  boxSep="\e[38;5;60m\n├────────┼───────────┼────────────────┼────────────────┤\e[0m\n"
  boxPreFut="\e[38;5;60m\n├────────┴────┬──────┴────────────────┴────────────────┤\e[0m\n"
  #
  function banner {
    echo -e "        \e[38;5;255m_    \e[38;5;11m.  \e[38;5;255m,   \e[38;5;222m.           \e[38;5;11m."
    echo -e "    *  \e[38;5;255m/ \e[38;5;255m\_ \e[38;5;222m*  \e[38;5;255m/ \e[38;5;225m\_      \e[38;5;205m_  \e[38;5;222m*        \e[38;5;222m*   \e[38;5;255m/\'__        \e[38;5;11m*"
    echo -e "      \e[38;5;255m/    \e[38;5;225m\  \e[38;5;255m/    \e[38;5;225m\,   \e[38;5;205m((        \e[38;5;11m.    \e[38;5;225m_\e[38;5;255m/  /  \  \e[38;5;222m*\e[38;5;11m'\e[38;5;222m."
    echo -e " \e[38;5;11m.   \e[38;5;60m/\e[38;5;225m\/\  /\e[38;5;225m\/ \e[38;5;60m:' \e[38;5;225m__ \e[38;5;218m\_  \e[38;5;205m\`          \e[38;5;218m_^/  ^\e[38;5;225m/    \e[38;5;60m\`--."
    echo -e "   \e[38;5;60m /    \e[38;5;225m\/  \  _/  \-\e[38;5;218m'\      \e[38;5;11m*    \e[38;5;218m/.' ^ _  \e[38;5;225m\_\e[38;5;60m   .'\  \e[38;5;222m*\e[0m"
    echo -e "  \e[38;5;255m/\  .-   \e[38;5;225m\`. \/     \e[38;5;218m\ \e[38;5;99m/==\e[38;5;97m~=-=\e[38;5;99m~=-\e[38;5;105m=-\e[38;5;218m;.  _/ \e[38;5;225m\ -. \e[38;5;255m\`\e[38;5;60m_/   \e[38;5;60m\\"
    echo -e " /  \e[38;5;255m\`-.__ \e[38;5;218m^   \e[38;5;225m/\e[38;5;60m .-\e[38;5;225m'\e[38;5;255m.\e[38;5;225m--\e[38;5;218m\ \e[38;5;97m=-=~\e[38;5;99m_=-\e[38;5;97m=~=^\e[38;5;218m/  \e[38;5;255m_ \`--\e[38;5;225m./ \e[38;5;60m.-'  \`-"
    echo -e "/        \e[38;5;255m\`.  \e[38;5;60m/ /       \e[38;5;218m\`\e[38;5;105m.~-^\e[38;5;99m=-=\e[38;5;105m~=^\e[38;5;99m=.\e[38;5;218m-'""     \e[38;5;60m '-._ \`._"
    echo -e "\e[38;5;60m"
  };
  #
  function boxHead {
    echo -e "                  \e[38;5;255m____ _     ___  ____\e[38;5;60m 		 "
    echo -e "╒══════════════   \e[38;5;255m|__| |     |__] [__ \e[38;5;60m   ══════════════╕"
    echo -e "│░░░▒▒▒░░░▒▒▒░░   \e[38;5;255m|  | |___  |    ___]\e[38;5;60m   ░░▒▒▒░░░▒▒▒░░░│"
    echo -e "├──────────────────────────────────────────────────────┤"
    echo -e "│                  \e[38;5;105m-՝, alps --help ､´-\e[38;5;60m                 │"
    echo -e "└──────────────────────────────────────────────────────┘\e[0m"
  };
  #
  function printHelp {
    echo -e "\e[38;5;60m╒══════════════════════\e[38;5;105m   HELP   \e[38;5;60m══════════════════════╕"
    echo -e "│  \e[0mALP   \e[38;5;105maliases (& custom functions) manager tool     \e[38;5;60m│"
    echo -e "│\t\e[38;5;105m used for group and boot alias packets (.alp). \e[38;5;60m│"
    echo -e "├──────────────────────────────────────────────────────┤"
    echo -e "├>\e[0m ALP MASTER \e[38;5;60m                                         │"
    echo -e "│\t\e[38;5;105m .alps package maker. \e[38;5;60m                         │"
    echo -e "│                                                      │"
    echo -e "│[alpID]:    your package ID, format XXXX or less.     │"
    echo -e "│                                                      │"
    echo -e "│[alp name]: package name.                             │"
    echo -e "│                                                      │"
    echo -e "│[status]:   boot status. If \"my.alp\" is disabled      │"
    echo -e "│            aliases wouldn't define.                  │"
    echo -e "├──────────────────────────────────────────────────────┤"
    echo -e "├>\e[0m EDITOR \e[38;5;60m                                             │"
    echo -e "│\t\e[38;5;105m could be changed in top of the \"boot.sh\" file.\e[38;5;60m│"
    echo -e "├──────────────────────────────────────────────────────┤"
    echo -e "├>\e[0m BOOT \e[38;5;60m                                               │"
    echo -e "│\t\e[38;5;105m make shure you moved .alp file to \"alp\" folder\e[38;5;60m│"
    echo -e "│                                                      │"
    echo -e "│\t To add ALP to boot insert code below          │\n│\t to .bushrc:                                   │"
    echo -e "│├──>        \"\e[38;5;105m. [path to boot.sh]/boot.sh\e[38;5;60m\"         <──┤│"
    echo -e "├──────────────────────────────────────────────────────┤"
    echo -e "├>\e[0m Default aliases \e[38;5;60m                                    │"
    echo -e "│\t\e[38;5;105m alps \e[38;5;60m- open alps.                             │"
    echo -e "│\t\e[38;5;105m alpm \e[38;5;60m- open alp master.                       │"
    echo -e "└──────────────────────────────────────────────────────┘"

  }
  #
  function boxFut {
    printf  "\e[38;5;60m│  \e[38;5;105mCount: %02d  \e[38;5;60m│ \e[38;5;105mAuthor: %s%s \e[38;5;60m│\e[0m\n" $1 "$(owerLength 30 "$2")" "$(extraLength 30 "$2")"
    echo -e "\e[38;5;60m└─────────────┴────────────────────────────────────────┘\e[0m"
  };
    # ^ $1= count   $2= "Author"
  #
  function owerLength {
      local reqLength=$1
      local compString=$2

    lenWdots=$((${reqLength} - 2));

    if [[ ${#compString} -gt $reqLength ]]; then
      compString=$(printf "%.${lenWdots}s.." "${compString}")
    fi
    printf "%s" "${compString}"
  };
    # ^ change current string if need
    # ^ printf "%s" $(owerLength length "string")
  #
  function extraLength {
      local reqLength=$1
      local compString=$2

      compStringLen=${#compString}
      # echo $compStringLen
      filler=""
    while (( $compStringLen < $reqLength )); do
      filler+=" "
      compStringLen=${compStringLen}+1
    done
    printf "%s" "${filler}"
  };
    # ^ for extraLength adding new output string with spaces (needs slot extra "%s")
    # ^ printf "%s%s" "curStr"  "$(extraLength length "curStr")" <== quotes !important
  #
###
##
if [[ ("$1" != "") || ("$2" != "") ]]
then
  if [[ (($1 == "-h") || ($1 == "--help")) || (($2 == "-h") || ($2 == "--help")) ]]; then
    printHelp
    exit
  fi
  path="$1"
fi
##
pkgStatus=1
clrPkgStatus="\e[38;5;${alpStatus}m"
loadLineCount=$(cat ${path}/current | wc -l)
#echo "here:${loadLineCount}"
### Test
  # echo $loadLineCount
  # echo -e "$path"
###
###
###
# . ${path}/banner
banner
boxHead
### ^ banner load
###

###
printf "$boxCap"
##
for (( line=1; line<=$loadLineCount; line++))
do # execute Line(pkg's) times
  packet=$(cat ${path}/current | sed -n ${line}'p' | awk '{print substr($2,0);}') # skip ==> ". "
    # echo -e "$packet"
  alpID=$(cat ${packet} | grep "alpID" | awk '{print $2}') # grep 2nd word
  alpNm=$(cat ${packet} | grep "alpNm" | awk '{print $2}') # grep 2nd word
  alpStatus=$(cat ${packet} | grep "status:" | awk '{print $2}') # grep 2nd word)
  # ^ Getting packet & other sh!t
        if [[ ${alpID} == "" ]]; then
          alpID=0000
        fi
        # ^ If blank ID
        if [[ ${alpNm} == "" ]]; then
          alpNm="Empty: ${packet}"
        fi
        # ^ If blank Nm
  if [[ $alpStatus -eq "1" ]]; then
    alpStatus=78
    Status="\e[38;5;${alpStatus}m"
  else
    alpStatus=97
    Status="\e[38;5;${alpStatus}m"
  fi
  # ^ Status Colour
  printf "\e[38;5;60m│  ${Status}%04d\e[0m  " "${alpID}"
  # ^ ID
  if [[ ${alpNm} == "Empty: ${packet}" ]]
  then
    printf "\e[38;5;60m│  ${Status}\e[0m%s  " "${alpNm}"
  else
    printf "\e[38;5;60m│  ${Status}%s%s\e[0m  " "$(owerLength 7 "${alpNm}")" "$(extraLength 7 "${alpNm}")"
  fi
  # ^ Name
  for (( i=1; i <= $(cat ${packet} | grep "alias \b\|function \b" | wc -l); i++ ))
  { # read aliases and their content
      if [[ $alpNm == "Empty: $packet" ]]; then
        break
      fi
      # ^ Dont print after "Empty"
      #
      alsStatus=""
      als=$(cat ${packet} | grep "alias \b\|function \b" | awk '{print $2}' | cut -d = -f 1 | head -n $i | tail -n 1)
      cont=$(cat ${packet} | grep "alias \b\|function \b" | cut -d = -f 2 | head -n $i | tail -n 1 | awk -F '"' -v OFS="" '{$1=""; print}')
      # ^ Get aliases AND content
      #
      if [[ ($(cat ${packet} | grep "alias \b\|function \b" | awk '{print $1}' | head -n $i | tail -n 1) == "#") || ($(cat ${packet} | grep "alias \b\|function \b" | awk '{print $1}' | head -n $i | tail -n 1) == "#alias") ]]; then
        alsStatus="\e[38;5;97m"
      else
        alsStatus="\e[38;5;78m"
      fi
      # ^ Check "#" || "#alias"
      #
      printf "\e[38;5;60m│ ${alsStatus}%02d. %s%s \e[0m" $i "$(owerLength 10 "$als")" "$(extraLength 10 "$als")"
      printf "\e[38;5;60m│ ${alsStatus}%02d. %s%s \e[0m" $i "$(owerLength 10 "$cont")" "$(extraLength 10 "$cont")"
      printf "\e[38;5;60m│\e[0m"
      #
      #
      if (( !( i >= $(cat ${packet} | grep "alias \b\|function \b" | wc -l) ) ))
      then # if NOT last alias-line do:
        printf "${boxBlankHalf}"
      fi
  }
  ## Choose separator
  if (( ( $line >= $loadLineCount ) )); then
    printf "${boxPreFut}"
  else
    printf "${boxSep}"
  fi
  ## ^ Choose separator
done
  ##
  if (( ( $line == 1 ) ))
  then # line =1 assigned by loop[for] (anyway) # if it doesn change IT means that ther are NO pkgs
    printf "\e[38;5;60m├────────┴────┬──────┴────────────────┴────────────────┤\e[0m\n"
  fi
  ##
boxFut $loadLineCount "TENN UN1T"
