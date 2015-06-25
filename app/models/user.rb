class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bars
  has_many :ingredients, through: :bars
  has_many :cocktails

  def available_cocktails
    ingredients = self.ingredient_ids
    Cocktail.includes(:ingredients).where(ingredients: { id: ingredients })
  end
end
