class CocktailsController < ApplicationController
  def index
    @cocktails = if params[:keywords]
                   Cocktail.where('name ilike ?', "%#{params[:keywords]}%")
                 else
                   Cocktail.all.order(created_at: :desc)
                 end
  end
end
