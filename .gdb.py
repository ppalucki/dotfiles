### NO LONGER WORKS for newer gdb - newest_frame or selected_frame are broken or too old.
#import gdb
#loc = None
#def setloc():
#    global loc
#    try:
#        # loc = "%i:%s"%(gdb.newest_frame().find_sal().line, gdb.newest_frame().find_sal().symtab.filename)
#        loc = "%i:%s"%(gdb.selected_frame().find_sal().line, gdb.selected_frame().find_sal().symtab.filename)
#        # print(loc)
#    except gdb.error:
#        pass
#
#def setloc_tmux():
#    gdb.execute("shell tmux set-buffer '%s'"%loc)
#
## def is_running():
##     return gdb.current_objfile() is not None

