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
    click_on 'add'
    click_on 'Whiskey'
    within "#myBar" do
      expect(page).to have_content "Whiskey"
    end
  end
end
