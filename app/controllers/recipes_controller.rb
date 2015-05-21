class RecipesController < ApplicationController

require 'Parsenip'

  def index
    @recipes = current_user.recipes
    @recipes = @recipes.favorited if params[:favorites]
    @recipes = @recipes.tagged_with_all(params[:tags]) if params[:tags]
    @recipes = @recipes.favorited_and_tagged_with_all(params[:tags]) if params[:tags] && params[:favorites]
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe_new = current_user.recipes.new
    @recipe_new.attributes = recipe_params
    if @recipe_new.save
      redirect_to @recipe_new
    else
      flash[:error] = "Error creating recipe. Please try again."
      render :back
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
  end

  # def destroy
  #   @recipe = recipe.find(params[:id])
  #   if recipePolicy.new(current_user, @recipe).destroy?
  #     @recipe.destroy
  #     redirect_to :back
  #   end
  # end

private

  def recipe_params
    params.require(:recipe).permit(:link, :title, :intro, :ingredients, :steps, :notes, :subhead, :star, :all_tags, :tags, :favorites)
  end

end