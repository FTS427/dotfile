import sys, time, os, subprocess
from progressbar import *

download_url = sys.argv[1]
file_name = sys.argv[2]

aria2_path = '/usr/bin/aria2c'

command = ["--out=", file_name, "\"", download_url, "\""]
aria2_arg=" --out="+file_name+"\""+download_url+"\""

def dowork():
    time.sleep(0.01)

total = 1000
widgets = [file_name, ' ', Bar('#'), ' ', Percentage()]

progress = ProgressBar(widgets=widgets, max_value=10*total).start()
for i in range(total):
    os.system(aria2_path+aria2_arg)
    progress.update(10 * i +1)
    dowork()
progress.finish
