class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :posts
  has_many :faved_posts, through: :faves, source: :posts

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

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
