require 'rails_helper'

feature 'Looking up cocktail recipes', js: true do
  before do
    Cocktail.create!(name: "Singapore Sling")
    Cocktail.create!(name: "Margarita")
    Cocktail.create!(name: "Moscow Mule")
    Cocktail.create!(name: "Manhattan")
  end

  scenario 'finding recipes' do
    visit '/#/search'
    fill_in 'keywords', with: 'marg'
    click_on 'Search'

    expect(page).to have_content("Margarita")
  end
end
