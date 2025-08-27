class LikesController < ApplicationController
  before_action :require_login
  before_action :set_recipe

  def create
    @like = @recipe.likes.build(user: current_user, like: 1)
    
    if @like.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("like_button_#{@recipe.id}", 
            partial: "shared/like_button", locals: { recipe: @recipe })  # Changed from "recipes/like_button"
        end
        format.html { redirect_back(fallback_location: @recipe, notice: 'Recipe liked!') }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("like_button_#{@recipe.id}", 
          partial: "shared/like_button", locals: { recipe: @recipe }) }
        format.html { redirect_back(fallback_location: @recipe, alert: 'Unable to like recipe.') }
      end
    end
  end

  def destroy
    @like = @recipe.likes.find(params[:id])
    
    if @like.user == current_user
      @like.destroy
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("like_button_#{@recipe.id}", 
            partial: "shared/like_button", locals: { recipe: @recipe })  # Changed from "recipes/like_button"
        end
        format.html { redirect_back(fallback_location: @recipe, notice: 'Recipe unliked!') }
      end
    else
      respond_to do |format|
        format.turbo_stream { head :unprocessable_entity }
        format.html { redirect_back(fallback_location: @recipe, alert: 'You can only unlike your own likes.') }
      end
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end