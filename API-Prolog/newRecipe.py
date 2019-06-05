import sys

def main():
    name = "recetas.pl"
    file = open(name)
    txt = file.read()
    file.close()

    file = open(name, 'w+')
    #argv[1]: nombre receta
    #argv[2]: tipo receta
    #argv[3]: lista de ingredientes
    #argv[4]: pasos
    #argv[5]: lista de nombre de imagenes

    string = "receta('"+sys.argv[1]+"','"+sys.argv[2]+"',"+"["+listParser(sys.argv[3])+"],'"+sys.argv[4]+"',"+"["+listParser(sys.argv[5])+"])."
    txt = string+"\n"+txt
    file.write(txt)
    file.close()
    print(txt)

def listParser(list):
    newString = ""
    flag = False
    for letter in list:
        if(flag == False):
            newString = newString + "'"
            flag = True
        if(letter == ','):
            newString = newString + "',"
            flag = False
        else:
            newString = newString + letter
    newString = newString + "'"
    return newString



main()
