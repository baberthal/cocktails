FactoryGirl.define do
  factory :user do |f|
    f.sequence(:username) { |n| "foobar#{n}" }
    f.password "foobarsecret"
    f.sequence(:email) { |n| "foobar#{n}@example.com" }
  end

end
