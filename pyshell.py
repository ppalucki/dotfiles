"""
copy me to PYTHONPATH
and then use
from pyshell import main; main(dict(globals(),**locals())

"""

import wx

class App(wx.App):
    """PyShell standalone application."""

    def __init__(self, val, locals):
        self.locals = locals
        wx.App.__init__(self, val)

    def OnInit(self):
        import os
        import wx
        from wx import py

        self.SetAppName("pyshell")
        confDir = wx.StandardPaths.Get().GetUserDataDir()
        if not os.path.exists(confDir):
            os.mkdir(confDir)
        fileName = os.path.join(confDir, 'config')
        self.config = wx.FileConfig(localFilename=fileName)
        self.config.SetRecordDefaults(True)

        self.frame = py.shell.ShellFrame(config=self.config, dataDir=confDir, locals=self.locals)
        self.frame.Show()
        self.SetTopWindow(self.frame)
        return True

'''
The main() function needs to handle being imported, such as with the
pyshell script that wxPython installs:

    #!/usr/bin/env python

    from wx.py.PyShell import main
    main()
'''

def main(locals=None):
    """The main function for the PyShell program."""
    app = App(0, locals)    
    app.MainLoop()

if __name__ == '__main__':
    main()
