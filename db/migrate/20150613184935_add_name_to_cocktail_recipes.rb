class AddNameToCocktailRecipes < ActiveRecord::Migration
  def change
    add_column :cocktail_recipes, :name, :string
    add_column :cocktail_recipes, :instructions, :text
  end
end
