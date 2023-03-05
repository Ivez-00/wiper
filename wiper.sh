#!/system/bin/sh

WIPER() {
clear
#-- Red
R="\033[91m"
#-- Green
G="\033[92m"
#-- Orange
O="\033[93m"
#-- Blue
B="\033[94m"
#-- Magenta		
M="\033[95m"
#-- Grey background
GB="\033[100m"
#-- No Background
NB="\033[0m"

#-- Intro
echo -e "\n$O"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"$NB"

echo -e "$G""""""""
          ******       ******
           *****       *****
            **** ***** ****
             *** ** ** ***
              ****   ****
               ***   ***
                **   **
     """"""""$NB"
     
echo -e "$O"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"$NB"

echo -e  "$M""$GB"- wiper, system wide junk file cleaner"$GB"
echo "- lightweight tool for cleaning your device"
echo "- version 2.0"
echo "- NOTE: if the (check) and (wipe)"
echo "- returned a (directory not found) means"
echo "- the directory and files has been deleted"

echo -e "$O"______________________________________"$NB"
echo -e "$O"WIPER V2"$NB"
echo -e "$O"---------------------------------------"$NB\n"
echo -e "$M""$GB"Usage : Select the number of your choice"$GB\n"

A=/storage/emulated/0/Android/data/*/cache
B=/storage/emulated/0/pictures/.thumbnails
C=/data/user/0/*/code_cache
D=/data/user/0/*/cache
E=/data/user_de/0/*/cache
F=/data/user_de/0/*/code_cache

select Z in Check Wipe Exit;
do case $Z in

Check) echo -e "\n$R""$GB"Checking.."$GB\n";

#-- finding all cache files in target directory and sums the total

for X in $(find $A $B $E -exec du -hc {} + | grep total | awk '{print $1}'); do
echo -e "$R""$GB"You have a $X of cache files in internal storage"$GB";
done; > /dev/null 2>&1

for Y in $(find $C $D $F -exec du -hc {} + | grep total | awk '{print $1}'); do
echo -e "$R""$GB"You have a $Y of cache files in Root storage"$GB";
done; > /dev/null 2>&1

sleep 3;

WIPER;;

Wipe) echo -e "\n$G""$GB"Wiping Trash Files..Will take a Moment..be patient."$GB\n";

#-- deleting all cache files in target directory and sums the total

for X in $(find $A $B $E); do
rm -rf $X;
done; > /dev/null 2>&1

for X in $(find $A $B $E -exec du -hc {} + | grep total | awk '{print $1}'); do
echo -e "$G""$GB"Trash files in internal storage deleted, total $X"$GB";
done; > /dev/null 2>&1

for Y in $(find $C $D $F); do
rm -rf $Y;
done; > /dev/null 2>&1

for Y in $(find $C $D $F -exec du -hc {} + | grep total | awk '{print $1}'); do
echo -e  "$G""$GB"Trash files in root storage deleted, total $Y"$GB";
done; > /dev/null 2>&1

sleep 3;

WIPER;;

Exit) echo -e "\n$R"Exiting.."$NB\n";
sleep 2;
clear;
exit;;

 esac
done
}

WIPER