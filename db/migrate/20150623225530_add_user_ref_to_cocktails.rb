class AddUserRefToCocktails < ActiveRecord::Migration
  def change
    add_reference :cocktails, :user, index: true, foreign_key: true
  end
end
