require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  render_views
  describe "#index" do
    before do
      @i1 = create(:ingredient)
      @i2 = create(:ingredient, name: "Gin")
      @i3 = create(:ingredient, name: "Vermouth", ingredient_type: "Aperitif")
      @i4 = create(:ingredient, name: "Lime Juice", ingredient_type: "Fruit Juice")

      xhr :get, :index, format: :json
    end

    subject(:results) { JSON.parse(response.body) }

    it 'should 200' do
      expect(response.status).to eq 200
    end

    it 'should return 4 results' do
      expect(results.size).to eq 4
    end

    it 'should contain the right ingredients' do
      expect(results.map(&extract_name)).to eq ['Gin', 'Lime Juice', 'Vermouth', 'Whiskey']
    end

  end

end
