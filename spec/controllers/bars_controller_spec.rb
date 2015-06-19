require 'rails_helper'

RSpec.describe BarsController, type: :controller do
  render_views
  login_user

  describe "#index" do
    before do
      @i1 = create(:ingredient)
      create(:ingredient, name: "Lemons")
      create(:ingredient, name: "Sour Mix")
      create(:ingredient, name: "Egg White")
      Bar.create(user: @user, ingredient: @i1)

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
      ingredient = results.map(&extract_ingredients)
      expect(ingredient.map(&extract_name)).to include "Whiskey"
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

end
