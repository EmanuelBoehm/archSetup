file = open("/home/emi/git/rust/farmer/assets/texture/tiles_spritesheet.xml","r")
res_file = open("/home/emi/spritesheet.ron","w")
res_file.write("List(( \n ")
res_file.write("texture_width: 8, \n ")
res_file.write("texture_height: 16, \n ")
res_file.write("sprites: [ \n ")
for line in file:
    vec = line.split(" ")
    first = 0
    sec = 0
    for attr in vec:
        arg = attr.split("=")
        if "<" in arg[0]:
            first = 0

        if arg[0] == "name":
            str = "name: " + arg[1]
            first += 1

        if arg[0] == "x":
            str = "x: " + arg[1]
            str = str.replace('"', "")
            first += 1

        if arg[0] == "y":
            str = "y: " + arg[1]
            str = str.replace('"', "")
            first += 1

        if arg[0] == "width":
            str = "width: " + arg[1]
            str = str.replace('"', "")
            first += 1

        if arg[0] == "height":
            str = "height: " + arg[1]
            str = str.replace('"', "")
            first += 1

        if first == 1:
            res_file.write("( \n")

        if first != sec:
            str.replace('/>', '')
            str = str.strip('\n')
            res_file.write(str.replace('/>', '') + ', \n')

        sec = first
    if first != 0:
        res_file.write("), \n")
res_file.write("], \n ")
res_file.write("))")
