class User < ActiveRecord::Base
  validates :user_name, :email, presence: true
  has_many :photos
  has_many :comments
  has_many :favorites
  has_many :photo_favorites, class_name: "Photo", foreign_key: "photo_id", through: :favorites
  has_many :tagged_users
  has_many :photo_tagged, class_name: "Photo", foreign_key: "photo_id", through: :tagged_users

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
