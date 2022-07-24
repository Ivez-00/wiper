SKIPUNZIP=1

MODEL=`getprop ro.product.model`
console_print() {
    ui_print "\n#####################################"

    ui_print """""""
          ******       ******
           *****       *****
            **** ***** ****
             *** ** ** ***
              ****   ****
               ***   ***
                **   **
           """""""  
     
     ui_print "######################################"
    ui_print "- checking device name"
    ui_print "- $MODEL"
    ui_print "- Magisk Ver $MAGISK_VER"
    if [ $MAGISK_VER_CODE -lt "23000" ]; then
    ui_print "- Magisk ver is low, install latest. aborting"
    abort
    else
    ui_print "- magisk ver pass"
    fi
    ui_print "- wiper"
    ui_print "- lightweight tool for cleaning your device"
    ui_print "- system wide cache cleaner by Ivez "
    sleep 1
    ui_print "•"
    ui_print "•"
    ui_print "•"
    
}

console_exec() {
    ui_print "- Extracting module files"
    unzip -o "$ZIPFILE" module.prop -d $MODPATH >&2
    unzip -o "$ZIPFILE" service.sh -d $MODPATH >&2
    unzip -o "$ZIPFILE" wiper -d $MODPATH >&2
    ui_print "- "
    
    
    ui_print "- Set permissions"
    set_perm_recursive $MODPATH 0 0 0755 0755
    set_perm_recursive $MODPATH/service.sh 0 0 0755 0755
    sleep 1
    ui_print "- usage : type "su" then "wiper" in termux"
    ui_print "- or in any terminal emulator"
    ui_print "- "
}

if [ ! "$SKIPUNZIP" = "0" ]; then
    set -x
    console_print
    console_exec
else
    set +x
    abort
fi

#let me know if my coding needs some correction/cleanup/
#or improvements

