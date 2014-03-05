### MOVED TO ~/workspace/djangoshellhelpers.py and run in 99_django.ipy
from IPython.core.magic import register_line_magic

try:

    @register_line_magic
    def gv(hashkey_or_provider_file_id):
        """Vod.objects.get_vod_by_(hashkey_or_provider_file_id)"""
        ip = get_ipython()
        ip.ex('from getmedia.system.allimports import *')
        if hashkey_or_provider_file_id.isdigit():
            cmd = 'v = Vod.objects.get_vod_by_provider_file_id(%i)'%int(hashkey_or_provider_file_id)
        else:
            cmd = "v = Vod.objects.get_vod_by_hash('%s')"%(hashkey_or_provider_file_id)
        print cmd
        ip.ex(cmd)
    del gv

    @register_line_magic
    def gl(channel_id):
        """c = get_channel_or_schannel_by_id(channel_id)"""
        ip = get_ipython()
        ip.ex('from getmedia.system.allimports import *')
        cmd = 'c = get_channel_or_schannel_by_id(%i, show_test_live=True)'%int(channel_id)
        print cmd
        ip.ex(cmd)
    del gl

    @register_line_magic
    def gag(accessgroup_code):
        """g = AccessGroup.get_by_code(accessgroup_code)"""
        ip = get_ipython()
        ip.ex('from getmedia.system.allimports import *')
        cmd = "g = AccessGroup.get_by_code('%s')"%accessgroup_code
        print cmd
        ip.ex(cmd)
    del gag

    @register_line_magic
    def gu(username_or_id):
        """get_user_for_username(username) or get_user(id) """
        ip = get_ipython()
        ip.ex('from getmedia.system.allimports import *')
        if username_or_id.isdigit():
            cmd = 'u = get_user(%i)'%int(username_or_id)
        else:
            cmd = "u = get_user_for_username('%s')"%username_or_id
        print cmd
        ip.ex(cmd)
    del gu

    @register_line_magic
    def di(line):
        """from getmedia.system.allimports import *"""
        ip = get_ipython()
        ip.ex('from getmedia.system.allimports import *')
    del di

    @register_line_magic
    def vi(line):
        """from getmedia.system.allimports import *"""
        ip = get_ipython()
        ip.run_line_magic('edit','-x '+line)
    del vi

except NameError:
    pass
