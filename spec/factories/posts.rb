
require 'faker'

FactoryGirl.define do
  factory :post do |f|
    f.title { Faker::Book.title }
    f.description { Faker::Hipster.sentence }
    user
  end
end
