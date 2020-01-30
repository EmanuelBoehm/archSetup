import subprocess
def getFile():
    path='/home/emi/.config/sxhkd/sxhkdrc'
    file = open(path)
    text = []
    step = False
    for line in file:
        if "#" in line and not line.startswith("#\n"):
            text.append(line)
            step = True
        elif step == True and not (line.startswith("\n") or line.startswith("#")):
            
            text[len(text)-1] = text[len(text)-1] + " " +  line
            step = False
    return text

insert = getFile()
f = open("shortcuts.txt","w+")
for line in insert:
    f.write(line)
