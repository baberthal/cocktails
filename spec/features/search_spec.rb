require 'rails_helper'

feature 'Looking up cocktail recipes', js: true do
  before do
    CocktailRecipe.create!(name: "Singapore Sling")
    CocktailRecipe.create!(name: "Margarita")
    CocktailRecipe.create!(name: "Moscow Mule")
    CocktailRecipe.create!(name: "Manhattan")
  end

  scenario 'finding recipes' do
    visit '/'
    fill_in 'keywords', with: 'marg'
    click_on 'Search'

    expect(page).to have_content("Margarita")
  end
end
