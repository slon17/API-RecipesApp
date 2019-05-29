#require '/models/recipe.rb'

class RecipesController < ApplicationController
  #authorize_resource :class => false
  before_action :authorize_request

  # GET /recipes
  def index
    @recipes = []
    #extraer de prolog junto al parse
    render json: @recipes, status: :ok
  end

  # GET /recipes/{recipe_name}
  def show
    #buscar receta mediante prolog
    render json: @recipe, status: :ok
  end

  # POST /recipes
  def create
    #parse ingredients and steps
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      #enviarlo a base de conocimientos
      render json: @recipe, status: :created
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
      :name, :ingredients, :steps, :type
    )
  end
end
