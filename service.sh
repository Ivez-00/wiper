#!/system/bin/sh
MODPATH=${0%/*}



mkdir $MODPATH/system/bin
cp $MODPATH/wiper /system/bin/wiper
set_perm_recursive $MODPATH/system/bin/wiper 0 0 0755 0755

#let me know if my code need some correction/cleanups
#or improvements
