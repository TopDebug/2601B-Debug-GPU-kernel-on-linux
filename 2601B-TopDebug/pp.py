
import gdb
import sys
import os
import importlib

mem_dir = os.path.abspath('/home/roots/TopDebug/mem')
if mem_dir not in sys.path: sys.path.insert(0, mem_dir)

import mem
importlib.reload(mem)

from mem import mem, imtool

img = mem('inputImg x640 y480 S2 P0')
imtool(img)


"""
-exec source /home/roots/TopDebug/2601B-Debug-GPU-kernel-on-Linux/TopDebug/pp.py

img = mem('inputImg x640 y480 S2 P0')
imtool(img)

img = mem('inputImg_d x640 y480 S2 P1')
imtool(img)

img = mem('img x640 y480 S2 P2')
imtool(img)

"""