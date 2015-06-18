require 'rails_helper'

feature 'What can I make?', js: true do
  before do
    create(:ingredient)
    create(:ingredient, name: "Lemons")
    create(:ingredient, name: "Sour Mix")
    create(:ingredient, name: "Egg White")
  end

  scenario 'Adding items to my bar' do
    visit '/#/what_can_i_make'
    within '#myBar' do
      click_on 'Add Ingredient'
      select 'Whiskey'
    end
  end
end
