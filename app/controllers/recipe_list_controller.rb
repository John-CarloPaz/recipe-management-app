class RecipeListController < ApplicationController
  def index
    @user_recipes = current_user.recipes if current_user
  end
end
