class TaggedUser < ActiveRecord::Base
  belongs_to :user_tagged, class_name: "User", foreign_key: :user_id
  belongs_to :photo_tagged, class_name: "Photo", foreign_key: :photo_id
end
