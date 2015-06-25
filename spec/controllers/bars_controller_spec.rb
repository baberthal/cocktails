require 'rails_helper'

RSpec.describe BarsController, type: :controller do
  render_views
  login_user

  describe "#index" do
    before do
      @whiskey = create(:ingredient)
      @lemons = create(:ingredient, name: "Lemons")
      @sour_mix = create(:ingredient, name: "Sour Mix")
      @egg_white = create(:ingredient, name: "Egg White")
      Bar.create(user: @user, ingredient: @whiskey)

      xhr :get, :index, format: :json
    end

    subject(:results) { JSON.parse(response.body) }

    it 'should 200' do
      expect(response.status).to eq 200
    end

    it 'should contain one result' do
      expect(results.size).to eq 1
    end

    it 'should contain "Whiskey"' do
      expect(results.map(&extract_name)).to include "Whiskey"
    end

    context 'when there is more than one user' do
      before do
        @user_two = create(:user)
        Bar.create(user: @user, ingredient: @lemons)
        Bar.create(user: @user_two, ingredient: @sour_mix)

        xhr :get, :index, format: :json
      end

      subject(:results) { JSON.parse(response.body) }

      it 'should only return bars belonging to the current user' do
        expect(results.map(&extract_name)).to_not include "Sour Mix"
        expect(results.map(&extract_name)).to include "Lemons"
      end

    end
  end

  describe "#create" do
    before do
      @i1 = create(:ingredient)
      create(:ingredient, name: "Lemons")
      create(:ingredient, name: "Sour Mix")
      create(:ingredient, name: "Egg White")
      xhr :post, :create, format: :json, bar: { user_id: @user.id, ingredient_id: @i1.id }
    end

    it 'should 201' do
      expect(response.status).to eq 201
    end

    it 'should have created the right bar item' do
      expect(Bar.last.user_id).to eq @user.id
      expect(Bar.last.ingredient_id).to eq @i1.id
      expect(Bar.last.ingredient.name).to eq "Whiskey"
    end
  end

  describe "#available_cocktails" do
    before  do
      @vodka = create(:ingredient, name: "Vodka")
      @lime = create(:ingredient, name: "Lime", ingredient_type: "Fruit")
      @ginger_beer = create(:ingredient, name: "Ginger Beer",
                             ingredient_type: "Mixer")
      Bar.create!(user_id: @user.id, ingredient_id: @vodka.id)
      Bar.create!(user_id: @user.id, ingredient_id: @lime.id)
      Bar.create!(user_id: @user.id, ingredient_id: @ginger_beer.id)
      @moscow = Cocktail.create!(name: "Moscow Mule",
                                 description: 'Vodka and Ginger Beer',
                                 instructions: "Do your thing")
      @moscow.ingredients << [@vodka, @ginger_beer, @lime]
      xhr :get, :available_cocktails, format: :json
    end

    subject(:results) { JSON.parse(response.body) }

    it 'should 200' do
      expect(response.status).to eq 200
    end

    it 'should return at least one cocktail' do
      expect(results.size).to be >= 1
    end

    it 'should include moscow mule' do
      expect(results.map(&extract_name)).to include "Moscow Mule"
    end
  end

end
