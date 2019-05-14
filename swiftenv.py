import os
if os.getenv('OUTLANG') == 'swift':
    genlang = 'swift4'
else:
    genlang = os.getenv('OUTLANG')

os.system("export GENLANG={}".format(genlang))
