class Bar < ActiveRecord::Base
  belongs_to :user
  belongs_to :ingredient

  validates :user, presence: true
  validates :ingredient, presence: true
  validates :ingredient, uniqueness: { scope: :user }
end
