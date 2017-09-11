class Post < ApplicationRecord
  belongs_to :user
  has_many :favers, through: :faves, source: :posts
end
