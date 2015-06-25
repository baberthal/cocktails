require 'rails_helper'

feature 'What can I make?', js: true do
  before(:each) do
    @user = create(:user)
    login_as(@user, scope: :user)
    @vodka = create(:ingredient, name: "Vodka")
    @ginger_beer = create(:ingredient, name: "Ginger Beer", ingredient_type: "Mixer")
    @lime = create(:ingredient, name: "Lime", ingredient_type: "Fruit")
  end

  scenario 'Adding items to my bar' do
    visit '/#/what_can_i_make'
    click_on 'add'
    click_on 'Ginger Beer'
    click_on 'add'
    click_on 'Vodka'
    click_on 'add'
    click_on 'Lime'
    within "#myBar" do
      expect(page).to have_content "Ginger Beer"
      expect(page).to have_content "Lime"
      expect(page).to have_content "Vodka"
    end
  end

  scenario 'Determining what I can make' do
    Bar.create!(user_id: @user.id, ingredient_id: @vodka.id)
    Bar.create!(user_id: @user.id, ingredient_id: @ginger_beer.id)
    Bar.create!(user_id: @user.id, ingredient_id: @lime.id)
    moscow = Cocktail.create!(name: "Moscow Mule",
                              description: 'Vodka and Ginger Beer',
                              instructions: "Do your thing")
    moscow.ingredients << [@vodka, @ginger_beer, @lime]
    visit '/#/what_can_i_make'
    within "#myBar" do
      expect(page).to have_content "Ginger Beer"
      expect(page).to have_content "Lime"
      expect(page).to have_content "Vodka"
    end
    expect(page).to have_content "Moscow Mule"
  end
end
