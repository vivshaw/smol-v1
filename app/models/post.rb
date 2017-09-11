class Post < ApplicationRecord
  belongs_to :user
  has_many :faves, dependent: :destroy
  has_many :favers, through: :faves, source: :users
  has_many :comments, dependent: :destroy

  def self.top3
    return Post.left_joins(:faves)
        .group(:id)
        .order('COUNT(faves.id) DESC')
        .limit(3)
  end

end
