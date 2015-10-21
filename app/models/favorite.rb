class Favorite < ActiveRecord::Base
  belongs_to :user_favorite, class_name: "User", foreign_key: :user_id
  belongs_to :photo_favorite, class_name: "Photo", foreign_key: :photo_id
end
