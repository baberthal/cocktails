require 'rails_helper'

RSpec.describe Bar, type: :model do
  context 'when it has valid attributes' do
    before do
      @user = create(:user)
      @ingredient = create(:ingredient)
      @bar = Bar.new(user: @user, ingredient: @ingredient)
    end

    it 'should be valid' do
      expect(@bar).to be_valid
    end

    it 'should respond to #user' do
      expect(@bar.user).to_not be nil
    end

    it 'should know who its user is' do
      expect(@bar.user).to be @user
    end

    it 'should respond to #ingredient' do
      expect(@bar.ingredient).to_not be nil
    end

    it 'should know what its ingredient is' do
      expect(@bar.ingredient).to be @ingredient
    end
  end


  context 'when it does not have valid attributes' do
    before do
      @user = create(:user)
      @ingredient = create(:ingredient)
    end

    it 'should be invalid without an ingredient' do
      bar = Bar.new(user: @user, ingredient: nil)
      expect(bar).to_not be_valid
    end

    it 'should be invalid without a user' do
      bar = Bar.new(user: nil, ingredient: @ingredient)
      expect(bar).to_not be_valid
    end

    it 'should be invalid without both a user and an ingredient' do
      bar = Bar.new(user: nil, ingredient: nil)
      expect(bar).to_not be_valid
    end
  end

  context 'when a user has a bar' do
    before do
      @user = create(:user)
      @whiskey = create(:ingredient)
      @gin = create(:ingredient, name: "Gin")
    end

    it 'is invalid if the user already has the ingredient in their bar' do
      Bar.create(user: @user, ingredient: @whiskey)
      bar = Bar.new(user: @user, ingredient: @whiskey)
      expect(bar).to_not be_valid
    end
  end
end
