#!/bin/bash
# debug mode :
# set -x
#####################################
#
# Warning :  This script is for the use of authorized users only.
# Developper : Ben00it
# Desciption : Script for find a chain in logs 
# 
#
#############################################################################
#            -       Declare functions and vars   -                         #
#############################################################################

## VARS
#Color
VERT="\\033[1;32m"
JAUNE="\\033[1;33m"
NEUTRE="\\e[0;m"
ROUGE="\\033[1;31m"
CYAN="\\033[11;36m"

## VARS Programs
DAY=`date +%Y-%m-%d`

## Fonction
# -> Only for an argument quick search in firewalls logs e.g: "./search.sh 10.147.0.2"
function check_arg {
if [ -n "$1" ]; then
echo -e $JAUNE ""
echo "-------------# Firewalling Searching #---------------------------"
echo "  ____  _    _ _____ _      _____        __  _____  _____ _____  "
echo " |  _ \| |  | |_   _| |    |  __ \      / / |  __ \|_   _|  __ \ "
echo " | |_) | |  | | | | | |    | |  | |    / /  | |__) | | | | |__) |"
echo " |  _ <| |  | | | | | |    | |  | |   / /   |  _  /  | | |  ___/ "
echo " | |_) | |__| |_| |_| |____| |__| |  / /    | | \ \ _| |_| |     "
echo " |____/ \____/|_____|______|_____/  /_/     |_|  \_\_____|_|     "
echo "                                                                 "
echo "-------------# Firewalling Searching #---------------------------"
echo -e $NEUTRE "This program is looking for a chain in systems logs"
echo
echo -e $NEUTRE "You're currently Looking for that item (only in firewalls logs) =>" $ROUGE "$1" $NEUTRE
sleep 0.5
echo "Launch research..."
echo
sleep 0.5
echo -e $VERT "zcat -f /data/log/res-f*/$DAY* | grep -E --color \"$1\""
echo -e $NEUTRE
sleep 3
zcat -f /data/log/res-f*/$DAY* | grep -E --color "$1"
echo ""
echo -e $CYAN "Resultat de votre commande : zcat -f /data/log/res-f*/$DAY* | grep -E --color \"$1\""
echo -e $NEUTRE  ""
exit
fi

}


function run_search {
echo " "
echo "Launch research " ; sleep 1.5
echo
echo -e $CYAN "zcat -f /data/log/res-$LETTER*/$DAY* | grep -E --color \"$ITEM\""
sleep 2
zcat -f /data/log/res-$LETTER*/$DAY* | grep -E --color "$ITEM"
echo ""
echo -e $VERT "/!\ Recherche terminée : OK"
echo -e $CYAN "Resultat de votre commande : zcat -f /data/log/res-$LETTER*/$DAY* | grep -E --color \"$ITEM\""
echo -e $NEUTRE
exit
}

#############################################################################
#            -         Loading Program        -                             #
#############################################################################

# Clear screen
clear

# Function quick search with Arguments => 'check_arg'
        # Exemple = ./lycos.sh "10.0.0.1"
check_arg $1

# Display program :
echo -e $JAUNE ""
echo "-------------# Firewalling Searching #---------------------------"
echo "  ____  _    _ _____ _      _____        __  _____  _____ _____  "
echo " |  _ \| |  | |_   _| |    |  __ \      / / |  __ \|_   _|  __ \ "
echo " | |_) | |  | | | | | |    | |  | |    / /  | |__) | | | | |__) |"
echo " |  _ <| |  | | | | | |    | |  | |   / /   |  _  /  | | |  ___/ "
echo " | |_) | |__| |_| |_| |____| |__| |  / /    | | \ \ _| |_| |     "
echo " |____/ \____/|_____|______|_____/  /_/     |_|  \_\_____|_|     "
echo "                                                                 "
echo "-------------# Firewalling Searching #---------------------------"
echo -e $NEUTRE  "This program is looking for a chain in systems logs"
echo
echo "In which item do you wanna search : "
echo "-------------------------------"
echo "- c : Switchs"
echo "- d : DNS"
echo "- f : Firewall"
echo "- i : IDS"
echo "- l : Load balancer F5 LTM"
echo "- m : MRV"
echo "- p : Proxy"
echo "- r : Router"
echo "- t : TAP"
echo "-------------------------------"
read -p " -> Enter the letter : " LETTER
echo ""
echo -e "Which IP/item are you looking for ?"
echo ""
echo "For source and destination research, enter : pattern1.*pattern2"
echo "                                   Example : 10.0.0.1.*10.0.0.2 (AND)"
echo "                                   Example : 10.0.0.1|10.0.0.2 (OR)"
echo ""
read -p " -> IP : " ITEM
echo
echo "Use current DAY : $DAY ? "
read -p "[y/n]" ANSWER_DAY

        if [[ ${ANSWER_DAY} == "n" ]]; then
                        read -p " -> Enter your custom day :" DAY
                        run_search
                        exit 0
                else
                        run_search

        fi

exit 0
