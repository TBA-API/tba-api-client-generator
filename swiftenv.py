import os
print(os.getenv('OUTLANG'))
if os.getenv('OUTLANG') == 'swift':
    print("Swift")
    os.putenv('GENLANG', 'swift4')
else:
    print('Not Swift')
    os.putenv('GENLANG', os.getenv('OUTLANG'))
