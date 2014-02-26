"""
ipdb but with synchronize_with_editor hook

sudo ln -s /usr/local/lib/python2.7/dist-packages/vipdb.py /home/ppalucki/dotfiles/.vim/vipdb.py

and then use:

import vipdb;vipdb.set_trace()

then from vim
gs - go step
gr - go retrun
gn - go next
gl - go location
gu - go up (traceback)

"""
from ipdb.__main__ import Pdb, update_stdout, wrap_sys_excepthook, def_colors
import sys
# import zmq
import os, time
# from Queue import Queue, Empty 
# from threading import Thread
# 
sock = None
# queue = Queue()
# sockname = 'tcp://127.0.0.1:5555'
# lastloc = None
# sockname = 'inproc://somename'

def synchronize_with_editor(ip, filename, line, value):
    # global sock
    # if sock is None:
    #     ctx = zmq.Context()
    #     sock = ctx.socket(zmq.PAIR)
    #     sock.connect(sockname)
    if filename.endswith('.pyc'):
        filename = filename.replace('.pyc', '.py')

    fn = os.path.join(os.getcwd(), filename)
    file('/tmp/vim.loc', 'w').write('%s %i'%(fn, line))
    # sock.send('%s %i'%(fn, line))
    # print 'loc sent'

# def serv_start():
#     global sock
#     if sock is None:
#         ctx = zmq.Context()
#         sock = ctx.socket(zmq.PAIR)
#         sock.bind(sockname)

# class ReaderThread(Thread):
#     def run(self):
#         global sock
#         if sock is None:
#             ctx = zmq.Context()
#             sock = ctx.socket(zmq.PAIR)
#             sock.bind('tcp://127.0.0.1:5555')
#         while True:
#             queue.put(sock.recv().split())
#             time.sleep(1)
# 
# def start_reader():
#     ReaderThread().start() # thread

def get_location():
    # try:
    #     fn, line = queue.get_nowait()
    # except Empty:
    #     return None, None 
    # global sock, lastloc
    # if sock is None:
    #     serv_start()
    # try:
    #     lastloc = sock.recv(zmq.NOBLOCK).split()
    #     # lastloc = sock.recv().split()
    #     return lastloc
    # except zmq.ZMQError, e:
    #     if lastloc:
    #         return lastloc
    #     return None, None
    if os.path.isfile('/tmp/vim.loc'):
        return file('/tmp/vim.loc','r').read().split()
    return None, None

def set_trace(frame=None):
    update_stdout()
    wrap_sys_excepthook()
    if frame is None:
        frame = sys._getframe().f_back
    pdb = Pdb(def_colors)

    # set hook
    pdb.shell.set_hook('synchronize_with_editor', synchronize_with_editor)

    pdb.set_trace(frame)

def embed(pdb=False):
    from IPython.terminal.embed import InteractiveShellEmbed, load_default_config
    from IPython import Application, embed, get_ipython
    config = load_default_config()
    config.InteractiveShellEmbed = config.TerminalInteractiveShell
    config.InteractiveShellEmbed.pdb = pdb

    shell = InteractiveShellEmbed.instance(config=config)

    # my hook
    shell.set_hook('synchronize_with_editor', synchronize_with_editor)

    ### di, gu, gv etc...
    shell.safe_execfile('/home/ppalucki/workspace/djangoshellhelpers.py')

    ### start
    shell(stack_depth=2)


