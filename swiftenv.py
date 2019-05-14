import os
if os.getenv('OUTLANG') == 'swift':
	os.putenv('GENLANG', 'swift4')
else:
	os.putenv('GENLANG', os.getenv('OUTLANG'))
