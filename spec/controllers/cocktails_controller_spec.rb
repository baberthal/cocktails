require 'rails_helper'

RSpec.describe CocktailsController, type: :controller do
  render_views
  describe "#index" do
    before do
      @c1 = create(:cocktail, name: "Margarita")
      @c2 = create(:cocktail, name: "Margarita (Cadillac)")
      @c3 = create(:cocktail, name: "Manhattan")
      @c4 = create(:cocktail, name: "Singapore Sling")

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

  describe "show" do
    before do
      xhr :get, :show, format: :json, id: cocktail_id
    end

    subject(:results) { JSON.parse(response.body) }

    context "when the cocktail exists" do
      let(:cocktail) { create(:cocktail) }
      let(:cocktail_id) { cocktail.id }

      it { expect(response.status).to eq(200) }
      it { expect(results["id"]).to eq(cocktail.id) }
      it { expect(results["name"]).to eq(cocktail.name) }
      it { expect(results["description"]).to eq(cocktail.description) }
    end

    context 'when the cocktail does not exist' do
      let(:cocktail_id) { -9999 }
      it { expect(response.status).to eq(404) }
    end
  end

  describe "create" do
    context "when the user is authenticated" do
      login_user
      before do
        cocktail = build(:cocktail)
        xhr :post, :create, format: :json, cocktail: { name: cocktail.name }
      end
      it { expect(response.status).to eq(201) }
      it { expect(Cocktail.last.name).to eq("Margarita") }
    end

    context "when the user is not authenticated" do
      before do
        cocktail = build(:cocktail)
        xhr :post, :create, format: :json, cocktail: { name: cocktail.name }
      end
      it { expect(response.status).to eq(401) }
    end

  end

  describe "update" do
    context "when the user is authenticated" do
      login_user
      let(:cocktail) { create(:cocktail) }

      before do
        xhr :put, :update, format: :json, id: cocktail.id, cocktail: { name: "Archer's Margarita" }
        cocktail.reload
      end

      it { expect(response.status).to eq(204) }
      it { expect(cocktail.name).to eq("Archer's Margarita") }
    end

    context "when the user is not authenticated" do
      let(:cocktail) { create(:cocktail) }

      before do
        xhr :put, :update, format: :json, id: cocktail.id, cocktail: { name: "Archer's Margarita" }
        cocktail.reload
      end

      it { expect(response.status).to eq(401) }
    end
  end

  describe "destroy" do
    context "when the user is authenticated" do
      login_user

      let(:cocktail_id) { create(:cocktail).id }

      before do
        xhr :delete, :destroy, format: :json, id: cocktail_id
      end

      it { expect(response.status).to eq(204) }
      it { expect(Cocktail.find_by_id(cocktail_id)).to be_nil }
    end

    context "when the user is not authenticated" do
      let(:cocktail_id) { create(:cocktail).id }

      before do
        xhr :delete, :destroy, format: :json, id: cocktail_id
      end

      it { expect(response.status).to eq(401) }
    end
  end

end
