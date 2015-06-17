require 'rails_helper'

RSpec.describe CocktailRecipesController, type: :controller do
  render_views
  describe "#index" do
    before do
      @c1 = create(:cocktail_recipe, name: "Margarita")
      @c2 = create(:cocktail_recipe, name: "Margarita (Cadillac)")
      @c3 = create(:cocktail_recipe, name: "Manhattan")
      @c4 = create(:cocktail_recipe, name: "Singapore Sling")

      xhr :get, :index, format: :json, keywords: keywords
      end

    subject(:results) { JSON.parse(response.body) }

    context 'when the search finds results' do
      let(:keywords) { 'marg' }

      it 'should 200' do
        expect(response.status).to eq 200
      end

      it 'should return 2 results' do
        expect(results.size).to eq 2
      end

      it 'should include "margarita"' do
        expect(results.map(&extract_name)).to include('Margarita')
      end

      it 'should include "margarita (cadillac)"' do
        expect(results.map(&extract_name)).to include ("Margarita (Cadillac)")
      end
    end

    context 'when the search does not find results' do
      let(:keywords) { 'foo' }
      it 'should return no results' do
        expect(results.size).to eq 0
      end
    end

    context 'when there is no search' do
      let(:keywords) { nil }
      it 'should 200' do
        expect(response.status).to eq 200
      end

      it 'should return all the cocktail recipes' do
        expect(results.size).to eq 4
      end

      it 'should order the results by created at' do
        expect(results.map(&extract_name)).to include 'Margarita'
        expect(results.map(&extract_name)).to include 'Margarita (Cadillac)'
        expect(results.map(&extract_name)).to include 'Manhattan'
        expect(results.map(&extract_name)).to include 'Singapore Sling'

      end
    end

  end
end
