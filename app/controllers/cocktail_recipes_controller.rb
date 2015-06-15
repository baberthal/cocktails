class CocktailRecipesController < ApplicationController
  def index
    @cocktail_recipes = if params[:keywords]
                          CocktailRecipe.where('name ilike ?', "%#{params[:keywords]}%")
                        else
                          CocktailRecipe.all.order(created_at: :desc)
                        end
  end
end
