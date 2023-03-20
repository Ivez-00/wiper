#!/system/bin/sh

WIPER() {
clear
#-- Red
RE="\033[91m"
#-- Green
GR="\033[92m"
#-- Orange
OR="\033[93m"
#-- Blue
BL="\033[94m"
#-- Magenta		
MA="\033[95m"
#-- Grey background
GB="\033[100m"
#-- No Background
NB="\033[0m"

#-- Intro
echo -e "\n$MA"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"$NB"

echo -e "$GR""""""""
          ******       ******
           *****       *****
            **** ***** ****
             *** ** ** ***
              ****   ****
               ***   ***
                **   **
     """"""""$NB"
     
echo -e "$MA"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"$NB"

echo -e  "$MA""$GB"- wiper, system wide junk file cleaner"$GB"
echo "- lightweight tool for cleaning your device"
echo "- version 2.0"
echo "- NOTE: if the (check) and (wipe)"
echo "- returned a (directory not found) means"
echo "- the directory and files has been deleted"

echo -e "$OR"______________________________________"$NB"
echo -e "$OR"WIPER V2"$NB"
echo -e "$OR"---------------------------------------"$NB\n"
echo -e "$GR""$GB"Usage : Select the number of your choice"$GB\n"

A=/storage/emulated/0/Android/data/*/cache
B=/storage/emulated/0/pictures/.thumbnails
C=/data/user/0/*/code_cache
D=/data/user/0/*/cache
E=/data/user_de/0/*/cache
F=/data/user_de/0/*/code_cache
#-- fstrim in newer android version 
FT=/system/bin/fstrim
#-- fstrim in older android version 
FS=/sbin/fstrim

select Z in Check Wipe Fstrim Exit;
do case $Z in

Check) echo -e "\n$GR""$GB"Checking.."$GB\n";

#-- finding all cache files in target directory and sums the total

X=$(du -hc $A $B $E | grep total | awk '{print $1}');

Y=$(du -hc $C $D $F | grep total | awk '{print $1}');

echo -e "\n$RE""$GB"You have a $X of cache files in internal storage"$GB\n";

echo -e "\n$RE""$GB"You have a $Y of cache files in Root storage"$GB\n";

sleep 3;
WIPER;;

Wipe) echo -e "\n$GR""$GB"Wiping Trash Files..Will take a Moment..be patient."$GB\n";

#-- deleting all cache files in target directory and sums the total

rm -rf $A
rm -rf $B
rm -rf $C
rm -rf $D
rm -rf $E
rm -rf $F


X=$(du -hc $A $B $E | grep total | awk '{print $1}');

Y=$(du -hc $C $D $F | grep total | awk '{print $1}');


echo -e "\n$OR""$GB"Trash files in internal storage deleted, total $X"$GB\n";


echo -e  "\n$OR""$GB"Trash files in root storage deleted, total $Y"$GB";

sleep 3;

WIPER;;

Fstrim) echo -e "\n$BL""$GB"Trimming mounted partitions, wil take a moment. please be patient"$GB\n";

#-- Not all devices supports fstrim, checking if your device is supported 
sleep 3;

case $FT in
/system/bin/fstrim)

for F in $(mount | awk '{print $3}'); do
$FT -v $F;
done;
echo "\n$GR""$GB"all mounted partitions Trimmed successfully!!"$GB";

sleep 3;

WIPER;;

/sbin/fstrim)

for F in $(mount | awk '{print $3}'); do
$FS -v $F;
done;
echo "\n$GR""$GB"all mounted partitions Trimmed successfully!!"$GB";

sleep 3;

WIPER;;

*)

echo "\n$RE""$GB"Fstrim not found, your device does not support it"$GB";

sleep 4;

WIPER;;
 esac;;

Exit) echo -e "\n$RE"Exiting.."$NB\n";
sleep 2;
clear;
exit;;

 esac
done
}

WIPER