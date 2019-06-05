#require '/models/recipe.rb'

class RecipesController < ApplicationController
  #authorize_resource :class => false
  before_action :authorize_request

  # GET /recipes
  def index
    #extraer de prolog junto al parse
    @hostname = "52.226.107.107"
    @username = "paulozuniga"
    @password = "Murcielago17"
    @cmd = "python3 allRecipes.py"

    Net::SSH.start(@hostname.to_s, @username.to_s, :password => @password.to_s) do |ssh|
      @recipes = JSON(ssh.exec!("source pyswip_env/bin/activate;"+@cmd.to_s))
      #file = File.read("#{Rails.root}/app/controllers/BC.txt")
      #puts @recipes
      @recipes = JSON.parse(@recipes.to_s)
  		ssh.close
    end

    render json: {recipes: @recipes}, status: :ok
  end

  # GET /recipes/{recipe_name}
  def show
    #buscar receta mediante prolog
    @hostname = "52.226.107.107"
    @username = "paulozuniga"
    @password = "Murcielago17"
    @cmd = "python3 recipeByName.py"

    Net::SSH.start(@hostname.to_s, @username.to_s, :password => @password.to_s) do |ssh|
      @recipes = JSON(ssh.exec!("source pyswip_env/bin/activate;"+@cmd.to_s))
      @recipes = JSON.parse(@recipes.to_s)
  		ssh.close
    end

    render json: {recipes: @recipes}, status: :ok
  end

  # POST /new-recipe
  def create
    #parse ingredients and steps
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      #enviarlo a base de conocimientos
      @hostname = "52.226.107.107"
      @username = "paulozuniga"
      @password = "Murcielago17"
      @cmd = "python3 newRecipe.py"+params[:name]+" "+params[:type]+" "+params[:ingredients]+params[:steps]+params[:images]

      Net::SSH.start(@hostname.to_s, @username.to_s, :password => @password.to_s) do |ssh|
        response = ssh.exec!("source pyswip_env/bin/activate;"+@cmd.to_s)
    		ssh.close
      end
      render json: {recipe: @recipe}, status: :ok
    else
      render json: { errors: @recipe.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /recipes/{recipe_name}
  def update
    unless @recipe.update(recipe_params)
      render json: { errors: @recipe.errors.full_messages },
             status: :unprocessable_entity
    else
      #enviar a base de conocimientos
    end
  end

  # DELETE /recipes/{recipe}
  def destroy
    @recipe.destroy
    #eliminar de base de conocimientos
  end

  private

  def find_recipe_by_name
    #@recipe = buscar por medio de prolog
    @user = User.find_by_email!(params[:email]) #verify if user is authorized
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Recipe
         not found' }, status: :not_found
  end

  def user_params
    params.permit(
      :email, :password
    )
  end

  def recipe_params
    params.permit(
      :name, :ingredients, :steps, :type, :images
    )
  end
end
