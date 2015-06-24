require 'rails_helper'

feature 'adding a recipe', js: true do
  before do
    create(:ingredient, name: "Tequila")
    create(:ingredient, name: "Cointreau", ingredient_type: "Liqueur")
    create(:ingredient, name: "Lime Juice", ingredient_type: "Fruit Juice")
    create(:ingredient, name: "Kosher Salt", ingredient_type: "Garnish")
    User.create!(username: 'foobar1',
                 email: 'foobar1@example.com',
                 password: 'foobar1secret')
  end

  scenario 'Adding a cocktail recipe' do
    visit '/'
    click_on 'Log In'
    within '#loginForm' do
      fill_in 'Email', with: 'foobar1@example.com'
      fill_in 'Password', with: 'foobar1secret'
      click_on 'Log In'
    end

    click_on 'add-a-recipe'
    within '#recipeForm' do
      fill_in 'Name', with: 'Margarita'
      fill_in 'Description', with: "Archer's Margarita. 5 ingredients..."
      fill_in 'Instructions', with: "2 oz. Tequila\n1 oz. Cointreau\n1 oz. Lime Juice\nMix all ingredients together, shake well. Serve over ice with salted rim."
      click_on 'Save'
    end

    expect(page).to have_content 'Margarita'
    expect(page).to have_content 'Created by foobar1'
  end
end
