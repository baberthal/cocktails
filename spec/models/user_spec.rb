require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is invalid without valid attributes' do
    u = User.new(username: nil, email: nil, password: nil)
    expect(u).to_not be_valid
  end

  it 'is valid with a username, email and password' do
    u = User.new(username: 'foobar', email: "foobar1@example.com", password: 'foobarsecret')
    expect(u).to be_valid
  end

  it 'is invalid if there is already a user with the same username' do
    User.create(username: 'foobar', email: 'foobar@example.com', password: 'foobarsecret')
    u = User.new(username: 'foobar', email: 'foobar@example.com', password: 'foobarsecret')
    expect(u).to_not be_valid
  end
end
