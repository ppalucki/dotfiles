#################################333
### KEYBOARD customization
### Capslock as Enter
### Right Alt swap with Rright Ctrl
### learn /usr/share/X11/xkb
### http://www.charvolant.org/~doug/xkb/html/index.html
# ESCAPE_KEYCODE=9
# CAPS_KEYCODE=66
# LCONTROL_KEYCODE=37
# SPACE=65
###############################k

### INSTALATION
# Startup Applications > Add > 
# Name: Remap keys 
# Command: /bin/bash /home/ppalucki/dotfiles/ubuntu_key_remap

### ---------------------- capslock as enter
# Disable caps-lock 
setxkbmap -option caps:none
# Remap Enter to Caps-lock
xmodmap -e 'keycode 66 = Return NoSymbol Return'

### ---------------------- !Swap right control and right alt
# 108 - to fizyczny prawy Alt
# 105 - to fizyczny prawy Ctrl

# 1.Turn off right Ctrl
xmodmap -e 'remove control = Control_R'
# 2. Physical right Ctrl acts as Alt
xmodmap -e 'keycode 105 = ISO_Level3_Shift NoSymbol ISO_Level3_Shift'
# 3. Physical right alt (108) acts as Control R
xmodmap -e 'keycode 108 = Control_R'
xmodmap -e 'add control = Control_R'
