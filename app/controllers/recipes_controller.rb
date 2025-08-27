class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
    unless @recipe.user == current_user
      flash[:alert] = "You can only edit your own recipes"
      redirect_to recipes_path
    end
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user 

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    unless @recipe.user == current_user
      flash[:alert] = "You can only edit your own recipes"
      redirect_to recipes_path
      return
    end

    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    unless @recipe.user == current_user
      flash[:alert] = "You can only delete your own recipes"
      redirect_to recipes_path
      return
    end

    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params.expect(:id))
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :image_url, :category, :cooking_time, :servings, 
                                 ingredients: [], instructions: [])
  end

  def require_login
    unless current_user
      flash[:alert] = "You must be logged in to access this section"
      redirect_to new_session_path
    end
  end
end