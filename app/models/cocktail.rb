class Cocktail < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :ingredients
  belongs_to :user
end
