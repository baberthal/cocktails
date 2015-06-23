require 'rails_helper'

RSpec.describe Cocktail, type: :model do
  it 'is invalid without a name' do
    cocktail = build(:cocktail, name: nil)
    expect(cocktail).to_not be_valid
  end

  it 'is invalid if one with the same name already exists' do
    create(:cocktail)
    c = build(:cocktail)
    expect(c).to_not be_valid
  end

  context 'when it already exists' do
    before do
      @cocktail = create(:cocktail)
      tequila = create(:ingredient, name: "Tequila")
      cointreau = create(:ingredient, name: "Cointreau", ingredient_type: "Liqueur")
      lime = create(:ingredient, name: "Lime", ingredient_type: "Fruit")
      triple_sec = create(:ingredient, name: "Triple Sec", ingredient_type: "Liqueur")
      salt = create(:ingredient, name: "Kosher Salt", ingredient_type: "Garnish")
      @cocktail.ingredients << [tequila, cointreau, lime, triple_sec, salt]
    end

    it 'should know what its ingredients are' do
      names = []
      @cocktail.ingredients.each { |n| names << n.name }
      expect(names).to include "Tequila"
    end
  end
end
