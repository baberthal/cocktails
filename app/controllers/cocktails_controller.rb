class CocktailsController < ApplicationController
  def index
    @cocktails = if params[:keywords]
                   Cocktail.where('name ilike ?', "%#{params[:keywords]}%")
                 else
                   Cocktail.all.order(created_at: :desc)
                 end
  end

  def create
    @cocktail = Cocktail.create(cocktail_params.merge(user_id: current_user.id))
    render 'show', status: 201
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)
    head :no_content
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    head :no_content
  end

  private
  def cocktail_params
    params.require(:cocktail).permit(:name, :instructions, :ingredients, :description)
  end
end
