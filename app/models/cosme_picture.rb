class CosmePicture < ApplicationRecord
  mount_uploader :picture, PictureUploader
  
  validates :user_id, presence:true
  validates :picture, presence:true
  belongs_to :user
  
   # タグ機能の実装
  acts_as_taggable            # acts_as_taggable_on :tags のエイリアス
  acts_as_taggable_on :tags # post.label_list が追加される
  
end
