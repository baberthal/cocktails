class ChangeTypeToIngredientType < ActiveRecord::Migration
  def change
    rename_column :ingredients, :type, :ingredient_type
  end
end
