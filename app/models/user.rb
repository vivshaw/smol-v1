class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :posts, dependent: :destroy
  has_many :faves, dependent: :destroy
  has_many :faved_posts, through: :faves, source: :posts
  has_many :comments, dependent: :destroy

  def to_param
    username
  end

  def get_colortheme
    colorthemes = {
      "yellow" => {primary: "gold", lighter: "light-yellow", accent: "yellow"},
      "red" => {primary: "red", lighter: "light-red", accent: "dark-red"},
      "blue" => {primary: "blue", lighter: "light-blue", accent: "navy"},
      "pink" => {primary: "hot-pink", lighter: "light-pink", accent: "dark-pink"},
      "green" => {primary: "green", lighter: "light-green", accent: "dark-green"},
      "grey" => {primary: "silver", lighter: "moon-gray", accent: "mid-gray"}
    }

    return colorthemes[colortheme]
  end

  # creates a new Fave with this user & the given post's id
  def fave!(post)
    self.faves.create!(post_id: post.id)
  end

  # destroys a Fave belonging to this user with the given post's id
  def unfave!(post)
    fave = self.faves.find_by_post_id(post.id)
    fave.destroy!
  end

  # Returns boolean whether post is faved by this user
  def fave?(post)
    self.faves.find_by_post_id(post.id)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      split = auth.info.email.split('@')
      name = split.first
      hash = Digest::SHA256.hexdigest split.last
      user.username = name + '-' + hash[0..4]
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
