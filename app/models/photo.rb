class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :tags
  has_many :tagged_users
  has_many :user_tagged, class_name: "User", foreign_key: "user_id", through: :tagged_users
  has_many :favorites
  has_many :user_favorites, class_name: "User", foreign_key: "user_id", through: :favorites
  has_attached_file :file, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\Z/
end
