class CosmePicture < ApplicationRecord
  mount_uploader :picture, PictureUploader
  
  validates :user_id, presence:true
  validates :picture, presence:true
  belongs_to :user
  

end
