class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :messages
  has_many :rooms, through: :messages
  has_many :room_users, dependent: :destroy

  include AvatarDecorator

end
