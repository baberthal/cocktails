require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is invalid without valid attributes' do
    u = User.new(username: nil, email: nil, password: nil)
    expect(u).to_not be_valid
  end

  it 'is valid with a username, email and password' do
    u = User.new(username: 'foobar', email: "foobar1@example.com", password: 'foobarsecret')
    expect(u).to be_valid
  end

  it 'is invalid if there is already a user with the same username' do
    User.create(username: 'foobar', email: 'foobar@example.com', password: 'foobarsecret')
    u = User.new(username: 'foobar', email: 'foobar@example.com', password: 'foobarsecret')
    expect(u).to_not be_valid
  end

  describe "#available_cocktails" do
    before :each do
      @u = create(:user)
      @vodka = create(:ingredient, name: "Vodka")
      @lime = create(:ingredient, name: "Lime", ingredient_type: "Fruit")
      @ginger_beer = create(:ingredient, name: "Ginger Beer", ingredient_type: "Mixer")
      Bar.create!(user_id: @u.id, ingredient_id: @vodka.id)
      Bar.create!(user_id: @u.id, ingredient_id: @lime.id)
      Bar.create!(user_id: @u.id, ingredient_id: @ginger_beer.id)
      @moscow = Cocktail.create!(name: "Moscow Mule",
                                description: 'Vodka and Ginger Beer',
                                instructions: "Do your thing")
      @moscow.ingredients << [@vodka, @ginger_beer, @lime]
    end

    it 'knows the users ingredients' do
      expect(@u.ingredients).to include @vodka
      expect(@u.ingredients).to include @lime
      expect(@u.ingredients).to include @ginger_beer
    end

  end
end
