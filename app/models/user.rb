class User < ActiveRecord::Base
  extend Enumerize
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enumerize :role, in: [:user, :admin, :guest], default: :user

  has_many :comments
  has_many :posts
end
