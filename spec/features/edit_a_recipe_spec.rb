require 'rails_helper'

feature "editing and deleting a review", js: true do
  scenario "editing an already existing review" do
    user = FactoryGirl.create(:user)
    create(:cocktail, user: user)
    login_as(user, scope: :user)
    visit '/'
    click_on "Edit"

    fill_in "name", with: "Archer's Margarita"
    fill_in "description", with: "5 ingredients..."

    click_on "Save"

    expect(page).to have_content("Archer's Margarita")
    expect(page).to have_content("5 ingredients...")
  end
end
