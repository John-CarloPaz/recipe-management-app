class HomepageController < ApplicationController
  def index
    @recipe = Recipe.first
    @featured_recipe = Recipe.order("RANDOM()").first
    @recipes = Recipe.order("RANDOM()").limit(3)
  end
end
