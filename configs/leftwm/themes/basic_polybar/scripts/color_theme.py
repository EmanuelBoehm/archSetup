#!/usr/bin/python 
import toml
import os
import subprocess
#loads toml into dictionary
theme_dic = toml.load("../theme.toml")
focused_border_color = os.popen('xgetres color3').read().rstrip()
theme_dic['focused_border_color'] = focused_border_color
toml.dump(theme_dic,open("../theme.toml",'w'))
