require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  it 'is invalid without a name' do
    ingredient = build(:ingredient, name: nil)
    expect(ingredient).to_not be_valid
  end

  it 'is invalid if an ingredient with the same name already exists' do
    create(:ingredient)
    ingredient = build(:ingredient)
    expect(ingredient).to_not be_valid
  end
end
