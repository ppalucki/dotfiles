#!/bin/bash
# Script "kmtest.sh"

TEST=`bind -v | awk '/keymap/ {print $NF}'`
if [ "$TEST" = 'vi-insert' ]; then
   echo -ne "\033]12;Green\007"
else
   echo -ne "\033]12;Red\007"
fi
