class Post < ApplicationRecord
  belongs_to :user
  has_many :faves, dependent: :destroy
  has_many :favers, through: :faves, source: :users
end
