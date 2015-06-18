class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.belongs_to :user
      t.belongs_to :ingredient

      t.timestamps null: false
    end
  end
end
