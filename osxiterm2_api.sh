# Bash function executing an Applescript to
# open a new iTerm2 pane (horizontal split) and cd to current folder
hsplit()
{
osascript -e "
tell application \"iTerm\"
 tell the first terminal
        tell application \"System Events\" to keystroke \"D\" using {command down, shift down}
  tell the current session
   write text \"cd '$(pwd)'\"
  end tell
 end tell
end tell"
}


# Bash function executing an Applescript to
# open a new iTerm2 tab and cd to current folder
new_tab()
{
osascript -e "
tell application \"iTerm\"
 tell the last terminal
  launch session \"Default Session\"
  tell the last session
   write text \"cd '$(pwd)'\"
  end tell
 end tell
end tell"
}

# Bash function executing an Applescript to
# open a new iTerm2 pane (vertical split) and cd to current folder
vsplit()
{
osascript -e "
tell application \"iTerm\"
 tell the first terminal
        tell application \"System Events\" to keystroke \"d\" using command down
  tell the current session
   write text \"cd '$(pwd)'\"
  end tell
 end tell
end tell"
}
