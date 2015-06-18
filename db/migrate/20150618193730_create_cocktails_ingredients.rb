class CreateCocktailsIngredients < ActiveRecord::Migration
  def change
    create_table :cocktails_ingredients, id: false do |t|
      t.belongs_to :cocktail, index: true
      t.belongs_to :ingredient, index: true
    end
  end
end
