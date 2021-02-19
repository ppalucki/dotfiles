set history save

# golang support
#source /usr/local/go/src/runtime/runtime-gdb.py
# NOT USED ANYMORE

# set breakpoint on main and run
#define bmainrun
#    b main.main
#    run
#end

# full python tracebacks
#set python print-stack full

#define reload
#    source ~/.gdbinit
#end

# Disable confirm for quit
define hook-quit
    set confirm off
end



# NO LONGER WORKS - please see direct tmux command to set tmux buffer
# Get location and store in loc
#py
#import gdb
#loc = None
#def setloc():
#    global loc
#    sal = gdb.decode_line()
#    if len(sal):
#        sal = sal[1][0]
#        loc = "%i:%s"%(sal.line, sal.symtab.filename)
#
## Get loc and store in tmux buffer
#def setloc_tmux():
#    gdb.execute("shell tmux set-buffer '%s'"%loc)
#
#end
#
#define setloc_tmux
#    py setloc()
#    py setloc_tmux()
#end
#
#define hookpost-next
#    setloc_tmux
#end
#
#define hookpost-run
#    setloc_tmux
#end
#
#define hookpost-step
#    setloc_tmux
#end
#
#define hookpost-advance
#    setloc_tmux
#end
#
#define hookpost-finish
#    setloc_tmux
#end
#
#define hookpost-up
#    setloc_tmux
#end
#
#define hookpost-down
#    setloc_tmux
#end
#
#define hookpost-continue
#    setloc_tmux
#end
