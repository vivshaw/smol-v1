
require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password }
    f.username { Faker::Internet.user_name }
    f.colortheme { ["yellow", "green", "blue", "red", "pink", "grey"].sample }
  end
end
