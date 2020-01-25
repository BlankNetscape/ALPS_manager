#!/bin/bash
editor="nano"
##
alpID=;
alpNm=;
alpSt=;
##
echo -e "\e[38;5;105mEnter AlpID"" - format XXXX or less\e[0m"
printf "\e[38;5;105m└─> \e[0m:"
read -r
if [[ $REPLY =~ ^-?[0-9]+$ ]]
then
  if [[ ${#REPLY} -gt 4 ]]; then
    echo " - Too long."
    exit
  fi
else
  echo " - NaN"
  exit
fi
alpID=$REPLY
##
echo -e "\e[38;5;105mEnter Alp Name"" - format 'aabbccd' [x7 or less]\e[0m"
printf "\e[38;5;105m└─> \e[0m:"
read -r
if [[ $REPLY == "" ]]
then
  echo -e " - Empty. Exiting.."
  return
fi
alpNm=$REPLY
##
echo -e "\e[38;5;105mChoose status"" - format ('1'= Enable)/('0'= Disable)\e[0m"
printf "\e[38;5;105m└─> \e[0m:"
read -r
if [[ $REPLY =~ ^[0]$ ]]
then
  printf ""
elif [[ $REPLY =~ ^[1]$ ]]; then
  printf ""
else
  echo -e "Death"
  return
fi
alpSt=$REPLY
##
# echo "$alpID  $alpNm  $alpSt"
function HAT {
  printf ""
  printf "######################################################## \n### ALP ### %04d ### %s\n" "$1" "$2"
}
# $1=ID $2=Nm
function FUT {
  printf "###\n#alpID: $1\n#alpNm: $2\n#status: $3\n#author: $(hostname)\n#help: $4\n########################################################"
}
# $1=ID $2=Nm $3=St $4=Help
###
###
###
touch temp.alp
##
echo -e "### Aliases goes down here. \n# e.x.: al1as test=(\"do things\")\n# e.x.: funct1on name() { \"do this\" } #=\"comment here\"\n#" > ./temp.alp
${editor} temp.alp
#
echo -e "$(HAT ${alpID} "${alpNm}")" | cat - temp.alp > temp && mv temp temp.alp
#
echo -e "$(FUT ${alpID} ${alpNm} ${alpSt} ${alpHp})" >> ./temp.alp
#
printf "\e[38;5;105mName file:\e[0m\n 1. '%04d.alp'\n 2. '%s.alp'\n" "${alpID}" "${alpNm}"
printf "\e[38;5;105m└─> \e[0m:"
read -r
case "$REPLY" in
1)        nTemp=$(printf "%04d" "${alpID}")
          mv temp.alp "${nTemp}.alp";;
2)        mv temp.alp "${alpNm}.alp";;

*)        echo -e "Undefined parameter: $REPLY";;
esac
echo -e "\e[38;5;11mComplete!\e[0m"
