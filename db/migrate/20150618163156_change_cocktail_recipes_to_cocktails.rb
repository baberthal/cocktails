class ChangeCocktailRecipesToCocktails < ActiveRecord::Migration
  def change
    rename_table :cocktail_recipes, :cocktails
  end
end
