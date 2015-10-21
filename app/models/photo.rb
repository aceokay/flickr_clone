class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :tags
  has_many :tagged_users
  has_many :user_tagged, class_name: "User", foreign_key: "user_id", through: :tagged_users
  has_many :favorites
  has_many :user_favorites, class_name: "User", foreign_key: "user_id", through: :favorites
end
