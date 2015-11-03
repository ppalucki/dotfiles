set history save

# golang support
# source /usr/local/go/src/runtime/runtime-gdb.py
add-auto-load-safe-path /usr/share/go/src/runtime/runtime-gdb.py
source /usr/share/go/src/runtime/runtime-gdb.py

# full python tracebacks
set python print-stack full

define reload
    source ~/.gdbinit
end

# set breakpoint on main and run
define bmainrun
    b main.main
    run
end


source ~/.gdb.py

define setloc_tmux
    py setloc()
    py setloc_tmux()
end

define hookpost-next
    setloc_tmux
end

define hookpost-run
    setloc_tmux
end

define hookpost-step
    setloc_tmux
end

define hookpost-advance
    setloc_tmux
end

define hookpost-finish
    setloc_tmux
end

define hookpost-up
    setloc_tmux
end

define hookpost-down
    setloc_tmux
end

define hookpost-continue
    setloc_tmux
end
