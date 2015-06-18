require 'rails_helper'

RSpec.describe Cocktail, type: :model do
  it 'is invalid without a name' do
    cocktail = build(:cocktail, name: nil)
    expect(cocktail).to_not be_valid
  end

  it 'is invalid if one with the same name already exists' do
    c1 = create(:cocktail)
    c2 = build(:cocktail)
    expect(c2).to_not be_valid
  end
end
