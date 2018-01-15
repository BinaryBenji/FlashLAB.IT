import cx_Freeze
import sys
import matplotlib
#import _tkinter
import os

base = None

include_files = [r"C:\Users\ASUS\AppData\Local\Programs\Python\Python36-32\tcl\tix8.4.3\tix84g.dll",
                 r"C:\Users\ASUS\AppData\Local\Programs\Python\Python36-32\tcl\tix8.4.3\tix84.dll"
#                 r"C:\Users\ASUS\AppData\Local\Programs\Python\Python36-32\DLLs\tk86t.dll"
#                 r"C:\Users\ASUS\AppData\Local\Programs\Python\Python36-32\DLLs\tcl86t.dll"
                 ]
build_exe_options = {"include_files": ["tcl86t.dll", "tk86t.dll"]}

if sys.platform == 'win32':
    base = "Win32GUI"

os.environ['TCL_LIBRARY'] = r'C:\Users\ASUS\AppData\Local\Programs\Python\Python36-32\tcl\tcl8.6'
os.environ['TK_LIBRARY'] = r'C:\Users\ASUS\AppData\Local\Programs\Python\Python36-32\tcl\tk8.6'

executables = [cx_Freeze.Executable("interface_finale.py", base=base, icon='img/logooooico.ico')]

cx_Freeze.setup(
    name = "FlashLab",
    options = {"build_exe": {"packages":["tkinter","matplotlib","PIL","idna"], "include_files":["img/logooooico.ico","img/logopoto2.png"]}},
    version = "2.0",
    description = "allow to deploy",
    executables = executables
    )
