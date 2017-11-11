class CosmePicture < ApplicationRecord
  validates :user_id, presence:true
  validates :picture, presence:true
  belongs_to :user
end
