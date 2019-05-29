#Recipe will manage all the information of every recipe that comes from Prolog

class Recipe

  #ingredients: array of ingredientes of the recipe
  #steps: array of steps to perform the recipe
  def initialize(name, ingredients, steps, type)
    @name = name
    @ingredients = ingredients
    @steps = steps
    @type = type
  end

  attr_accesor :name, :ingredients, :steps, :type

end
