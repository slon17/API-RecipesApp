from pyswip import Prolog
import json

def main():
    prolog = Prolog()
    prolog.consult("recetas.pl")

    result = list(prolog.query("receta(A,B,C,D,E)"))
    recipes = []

    for recipe in result:
        name = recipe['A']
        type = recipe['B']
        ingredients = []
        for ingredient in recipe['C']:
            ingredients.append(str(ingredient))
        steps = recipe['D']
        images = []
        for image in recipe['E']:
            images.append(str(image))
        recipes.append([name,type,ingredients,steps,images])
    #print(len(result))
    #print(result[0]['C'][0])
    #print(recipes[0][4][0])
    #print(json.dumps(recipes))
    print(json.dumps(recipes))
    return recipes

main()
