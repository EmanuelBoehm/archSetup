from shutil import copyfile
import os

str = os.getcwd()
copyfile("/home/emi/.vimrc","oldVimrc")
vimrc = open("/home/emi/.vimrc", "w") # option w for overwriting current content
for file in os.listdir("./vim/"):
    str = "vim/" + file
    vimrc.write(open(str).read())
vimrc.close()
