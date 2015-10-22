class User < ActiveRecord::Base
  validates :user_name, :email, presence: true
  has_many :photos
  has_many :comments
  has_many :favorites
  has_many :photo_favorites, class_name: "Photo", foreign_key: "photo_id", through: :favorites
  has_many :tagged_users
  has_many :photo_tagged, class_name: "Photo", foreign_key: "photo_id", through: :tagged_users

  before_save :make_admin

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def make_user_admin
    self.admin = true
  end

  def remove_admin
    self.admin = false
  end

private
  def make_admin
    if User.all.length < 2
      self.admin = true
    end
  end
end
